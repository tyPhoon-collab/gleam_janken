pub type Outcome {
  Win
  Lose
  Draw
}

pub fn to_string(outcome: Outcome) -> String {
  case outcome {
    Win -> "Win"
    Lose -> "Lose"
    Draw -> "Draw"
  }
}
