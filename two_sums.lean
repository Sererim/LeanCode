import Std.Data.HashMap
-- Given an array of integers nums and an integer target, return the indices i and j such that nums[i] + nums[j] == target and i != j.

-- You may assume that every input has exactly one pair of indices i and j that satisfy the condition.

-- Return the answer with the smaller index first.

def first_case   : List Nat := [1,4,5,6]
def first_target : Nat := 7

def second_case  : List Nat := [4, 5, 6]
def second_target  : Nat := 10

def thrid_case : List Nat := [5, 5]
def third_target : Nat := 10

open Std

def findPair (nums : List Nat) (target : Nat) : Option (Nat × Nat) :=
  let rec loop (nums : List Nat) (index : Nat) (map : HashMap Nat Nat) : Option (Nat × Nat) :=
    match nums with
    | [] => none
    | x :: xs =>
      match map[target - x]? with
        | some j => if j < index then some (j, index) else some (index, j)
        | none => loop xs (index + 1) (map.insert x index)
  loop nums 0 ( ∅ )

#eval findPair first_case first_target

#eval findPair second_case second_target

#eval findPair thrid_case third_target
