import gleeunit/should
import janken/hand

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
