import gleeunit
import gleeunit/should
import janken/hand.{Paper, Rock, Scissors}
import janken/outcome.{Draw, Lose, Win}
import janken/play

pub fn main() -> Nil {
  gleeunit.main()
}

// Draw cases
pub fn play_rock_vs_rock_test() {
  play.play(Rock, Rock)
  |> should.equal(Draw)
}

pub fn play_paper_vs_paper_test() {
  play.play(Paper, Paper)
  |> should.equal(Draw)
}

pub fn play_scissors_vs_scissors_test() {
  play.play(Scissors, Scissors)
  |> should.equal(Draw)
}

// Win cases
pub fn play_rock_vs_scissors_test() {
  play.play(Rock, Scissors)
  |> should.equal(Win)
}

pub fn play_paper_vs_rock_test() {
  play.play(Paper, Rock)
  |> should.equal(Win)
}

pub fn play_scissors_vs_paper_test() {
  play.play(Scissors, Paper)
  |> should.equal(Win)
}

// Lose cases
pub fn play_rock_vs_paper_test() {
  play.play(Rock, Paper)
  |> should.equal(Lose)
}

pub fn play_paper_vs_scissors_test() {
  play.play(Paper, Scissors)
  |> should.equal(Lose)
}

pub fn play_scissors_vs_rock_test() {
  play.play(Scissors, Rock)
  |> should.equal(Lose)
}
