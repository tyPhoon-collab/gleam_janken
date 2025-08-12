import gleam/io
import input
import janken/hand
import janken/outcome
import janken/play.{play}
import prng/random

pub fn main() {
  game_loop()
}

fn game_loop() {
  case game() {
    Quit -> Nil
    _ -> game_loop()
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
        "rock" | "r" -> Play(hand.Rock)
        "paper" | "p" -> Play(hand.Paper)
        "scissors" | "s" -> Play(hand.Scissors)
        _ -> Invalid
      }
    }
    Error(_) -> {
      io.println("Error reading input. Please try again.")
      Invalid
    }
  }
}

fn game() -> PlayerIntent {
  let intent = player_intent()
  case intent {
    Play(player_hand) -> {
      let computer_hand = computer_hand()

      io.println("Computer hand: " <> hand.to_string(computer_hand))
      io.println("Your hand: " <> hand.to_string(player_hand))

      io.println(
        play(player_hand, computer_hand)
        |> outcome.to_string,
      )
    }
    Invalid -> {
      io.println("Invalid input. Please try again.")
    }
    Quit -> {
      io.println("Thanks for playing!")
    }
  }
  intent
}
