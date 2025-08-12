import gleeunit
import gleeunit/should
import janken/outcome.{Draw, Lose, Win}
import janken/score

pub fn main() {
  gleeunit.main()
}

pub fn new_test() {
  let initial_score = score.new()
  initial_score.wins |> should.equal(0)
  initial_score.losses |> should.equal(0)
  initial_score.draws |> should.equal(0)
}

pub fn update_win_test() {
  let initial_score = score.new()
  let updated_score = score.update(initial_score, Win)
  updated_score.wins |> should.equal(1)
  updated_score.losses |> should.equal(0)
  updated_score.draws |> should.equal(0)
}

pub fn update_loss_test() {
  let initial_score = score.new()
  let updated_score = score.update(initial_score, Lose)
  updated_score.wins |> should.equal(0)
  updated_score.losses |> should.equal(1)
  updated_score.draws |> should.equal(0)
}

pub fn update_draw_test() {
  let initial_score = score.new()
  let updated_score = score.update(initial_score, Draw)
  updated_score.wins |> should.equal(0)
  updated_score.losses |> should.equal(0)
  updated_score.draws |> should.equal(1)
}

pub fn update_multiple_test() {
  let final_score =
    score.new()
    |> score.update(Win)
    |> score.update(Win)
    |> score.update(Lose)
    |> score.update(Draw)
    |> score.update(Win)

  final_score.wins |> should.equal(3)
  final_score.losses |> should.equal(1)
  final_score.draws |> should.equal(1)
}

pub fn to_string_test() {
  let s = score.Score(wins: 5, losses: 3, draws: 1)
  score.to_string(s)
  |> should.equal("Wins: 5, Losses: 3, Draws: 1")
}

pub fn to_string_zero_test() {
  score.new()
  |> score.to_string
  |> should.equal("Wins: 0, Losses: 0, Draws: 0")
}
