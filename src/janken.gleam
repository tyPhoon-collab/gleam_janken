import gleam/io
import input
import janken/hand
import janken/outcome
import janken/play.{play}
import janken/score
import prng/random

pub fn main() {
  game_loop(score.new())
}

fn game_loop(current_score: score.Score) {
  let #(intent, next_score) = game(current_score)
  case intent {
    Quit -> {
      io.println("Thanks for playing! Here is your final score:")
      io.println(score.to_string(next_score))
    }
    _ -> game_loop(next_score)
  }
}

type PlayerIntent {
  Play(hand.Hand)
  Invalid
  Quit
}

fn computer_hand() -> hand.Hand {
  case random.random_sample(random.int(0, 2)) {
    0 -> hand.Rock
    1 -> hand.Paper
    _ -> hand.Scissors
  }
}

fn player_intent() -> PlayerIntent {
  case input.input(prompt: "Please enter your hand (rock, paper, scissors): ") {
    Ok(string) -> {
      case string {
        "quit" | "q" -> Quit
        _ -> {
          case hand.from_string(string) {
            Ok(h) -> Play(h)
            Error(_) -> Invalid
          }
        }
      }
    }
    Error(_) -> {
      io.println("Error reading input. Please try again.")
      Invalid
    }
  }
}

fn play_round(player_hand: hand.Hand) -> outcome.Outcome {
  let computer_hand = computer_hand()

  io.println("Computer hand: " <> hand.to_string(computer_hand))
  io.println("Your hand: " <> hand.to_string(player_hand))

  let outcome = play(player_hand, computer_hand)
  io.println(outcome.to_string(outcome))
  outcome
}

fn game(current_score: score.Score) -> #(PlayerIntent, score.Score) {
  let intent = player_intent()
  let next_score =
    case intent {
      Play(player_hand) -> {
        let outcome = play_round(player_hand)
        let updated_score = score.update(current_score, outcome)
        io.println("Current score: " <> score.to_string(updated_score))
        updated_score
      }
      Invalid -> {
        io.println("Invalid input. Please try again.")
        current_score
      }
      Quit -> current_score
    }
  #(intent, next_score)
}
