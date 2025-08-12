import gleeunit/should
import janken/hand
import janken/outcome.{Draw, Lose, Win}
import janken/play

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
