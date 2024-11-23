import Std.Data.HashMap
-- Given an array of strings strs, group all anagrams together into sublists. You may return the output in any order.

-- An anagram is a string that contains the exact same characters as another string, but the order of the characters can be different.

-- Let's see how to convert a Character to its unicode value.
def ch : Char := 'a'
#eval ch.toNat -- 97

-- Now with a string !
def word : String := "Hello"

#eval word.toList

def sumOfChars : String → Nat
  | "" => 0
  | word =>
    word.toList.foldl (λ acc c => acc + c.toNat) 0

#eval sumOfChars word

def lst : List Char := word.toList

#eval lst[0].toNat + lst[1].toNat + lst[2].toNat + lst[3].toNat + lst[4].toNat

-- test cases
def first_case : List String :=
  ["act","pots","tops","cat","stop","hat"]

open Std

def findGroupAnagram (anagrams : List String) : List (List String) :=
  let addToMap (map : HashMap Nat (List String)) (str : String) : HashMap Nat (List String) :=
    let key := sumOfChars str
    match map[key]? with
    | some group => map.insert key (str :: group)
    | none       => map.insert key [str]
  let anagramMap := anagrams.foldl addToMap ( ∅ )
  anagramMap.toList.map (λ (_, group) => group)

#eval findGroupAnagram first_case
