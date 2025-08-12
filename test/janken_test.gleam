import gleeunit
import gleeunit/should
import janken/hand
import janken/outcome.{Draw, Lose, Win}
import janken/play

pub fn main() -> Nil {
  gleeunit.main()
}

// Draw cases
pub fn play_rock_vs_rock_test() {
  play.play(hand.Rock, hand.Rock)
  |> should.equal(Draw)
}

pub fn play_paper_vs_paper_test() {
  play.play(hand.Paper, hand.Paper)
  |> should.equal(Draw)
}

pub fn play_scissors_vs_scissors_test() {
  play.play(hand.Scissors, hand.Scissors)
  |> should.equal(Draw)
}

// Win cases
pub fn play_rock_vs_scissors_test() {
  play.play(hand.Rock, hand.Scissors)
  |> should.equal(Win)
}

pub fn play_paper_vs_rock_test() {
  play.play(hand.Paper, hand.Rock)
  |> should.equal(Win)
}

pub fn play_scissors_vs_paper_test() {
  play.play(hand.Scissors, hand.Paper)
  |> should.equal(Win)
}

// Lose cases
pub fn play_rock_vs_paper_test() {
  play.play(hand.Rock, hand.Paper)
  |> should.equal(Lose)
}

pub fn play_paper_vs_scissors_test() {
  play.play(hand.Paper, hand.Scissors)
  |> should.equal(Lose)
}

pub fn play_scissors_vs_rock_test() {
  play.play(hand.Scissors, hand.Rock)
  |> should.equal(Lose)
}

// hand.from_string
pub fn from_string_rock_test() {
  hand.from_string("rock")
  |> should.equal(Ok(hand.Rock))
}

pub fn from_string_r_test() {
  hand.from_string("r")
  |> should.equal(Ok(hand.Rock))
}

pub fn from_string_paper_test() {
  hand.from_string("paper")
  |> should.equal(Ok(hand.Paper))
}

pub fn from_string_p_test() {
  hand.from_string("p")
  |> should.equal(Ok(hand.Paper))
}

pub fn from_string_scissors_test() {
  hand.from_string("scissors")
  |> should.equal(Ok(hand.Scissors))
}

pub fn from_string_s_test() {
  hand.from_string("s")
  |> should.equal(Ok(hand.Scissors))
}

pub fn from_string_invalid_test() {
  hand.from_string("invalid")
  |> should.equal(Error(Nil))
}

pub fn from_string_empty_test() {
  hand.from_string("")
  |> should.equal(Error(Nil))
}
