import gleam/int
import janken/outcome.{type Outcome, Draw, Lose, Win}

pub type Score {
  Score(
    wins: Int,
    losses: Int,
    draws: Int,
  )
}

pub fn new() -> Score {
  Score(wins: 0, losses: 0, draws: 0)
}

pub fn update(score: Score, outcome: Outcome) -> Score {
  case outcome {
    Win -> Score(..score, wins: score.wins + 1)
    Lose -> Score(..score, losses: score.losses + 1)
    Draw -> Score(..score, draws: score.draws + 1)
  }
}

pub fn to_string(score: Score) -> String {
  "Wins: " <>
  int.to_string(score.wins) <>
  ", Losses: " <>
  int.to_string(score.losses) <> ", Draws: " <> int.to_string(score.draws)
}
