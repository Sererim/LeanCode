import Std.Data.HashMap
-- Given an integer array nums and an integer k, return the k most frequent elements within the array.
-- The test cases are generated such that the answer is always unique.
-- You may return the output in any order.

def first_case : List Nat := [1,2,2,3,3,3]
def first_k    : Nat := 2
def first_out  : List Nat := [3, 2]

def second_case : List Nat := [1, 1, 2, 2, 3, 3, 3, 3, 7, 7, 7, 7, 7, 10]
def second_k    : Nat := 3


open Ordering

-- Cutom ordering
def compare (a b : Nat × Nat) : Ordering :=
  if a.snd < b.snd then lt
  else if a.snd > b.snd then gt
  else eq

open Std

def top_k_freq (numbers : List Nat) (k : Nat) : List (Nat × Nat) :=
  let intermidiate := (numbers.foldl (λ acc n => acc.insert n (acc.getD n 0 + 1)) ( ∅ : HashMap Nat Nat)).toList
  (intermidiate.mergeSort (λ a b => compare a b == Ordering.gt)).take k

#eval (top_k_freq first_case first_k)
#eval top_k_freq second_case second_k