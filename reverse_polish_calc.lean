-- A simple implementation of a calculator that uses a reverse Polish Notation.
-- Can evaluate only Natural numbers as of Now.

inductive Operation : Type where
  | add | mul | sub | div | err
deriving Repr

def Operation.ofString : String → Operation
  | "+" => add
  | "*" => mul
  | "-" => sub
  | "/" => div
  |  _  => err

def stringToNat : String → Option Nat
  | "" => none
  | s =>
    if s.all (λ ch => ch.isDigit) then s.toNat?
    else none

def eval : Nat → Nat → Operation → Option Nat
  | n, m, .add => n + m
  | n, m, .mul => n * m
  | n, m, .sub => n - m
  | n, m, .div => n / m
  | _, _, .err => none

def parse : String → Option Nat
  | "" => none
  | s  =>
    let temp := s.splitOn
    if temp.length != 3 then
      none
    else
      eval (stringToNat (temp.get! 0)).get! (stringToNat (temp.get! 1)).get! (Operation.ofString (temp.get! 2))

#eval parse "200 200 /"
