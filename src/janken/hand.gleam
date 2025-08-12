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
