pub type Hand {
  Rock
  Paper
  Scissors
}

pub fn to_string(hand: Hand) -> String {
  case hand {
    Rock -> "Rock"
    Paper -> "Paper"
    Scissors -> "Scissors"
  }
}

pub fn from_string(s: String) -> Result(Hand, Nil) {
  case s {
    "rock" | "r" -> Ok(Rock)
    "paper" | "p" -> Ok(Paper)
    "scissors" | "s" -> Ok(Scissors)
    _ -> Error(Nil)
  }
}
