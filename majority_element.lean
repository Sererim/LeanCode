def test1 : List Nat := [3, 2, 3]
def test2 : List Nat := [2, 2, 2, 2, 1, 1, 1, 2]

def getMajority : List Nat → Nat → Nat → Nat
  | [], _, value => value
  | x :: xs, counter, value =>
    if value == x then getMajority xs (counter + 1) value
    else
      if counter == 0 then getMajority xs (0) x
      else getMajority xs (counter - 1) value

def findMajorityElement : List Nat → Nat
  | [] => 0
  | xs =>
    getMajority xs 0 0

#eval findMajorityElement test2
