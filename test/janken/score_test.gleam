import gleeunit/should
import janken/outcome.{Draw, Lose, Win}
import janken/score

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
