import janken/hand.{type Hand, Paper, Rock, Scissors}
import janken/outcome.{type Outcome, Draw, Lose, Win}

pub fn play(player: Hand, opponent: Hand) -> Outcome {
  case player, opponent {
    Rock, Rock -> Draw
    Paper, Paper -> Draw
    Scissors, Scissors -> Draw

    Rock, Scissors -> Win
    Paper, Rock -> Win
    Scissors, Paper -> Win

    _, _ -> Lose
  }
}
