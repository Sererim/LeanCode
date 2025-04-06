-- Return linked list from the middle
def test1 : List Nat := [1, 2, 3, 4, 5]
def test2 : List Nat := [1, 2, 3, 4, 5, 6]

def findMiddle : List Nat → Nat → List Nat
  | [], _ => []
  | _ :: xs, m =>
    if xs.length == m then xs
    else findMiddle xs m

def isEven : Nat → Bool
  | n => n &&& 1 != 1

def fromMiddle : List Nat → List Nat
  | [] => []
  | xs =>
    let middle := xs.length / 2
    findMiddle xs (if isEven middle then middle + 1 else middle)

#eval fromMiddle test1
#eval fromMiddle test2
