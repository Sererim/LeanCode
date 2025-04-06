def digits_1 : List Nat := [1, 2, 3, 4]
def digits_2 : List Nat := [9, 9, 9]

def incrmenet (lst : List Nat) : List Nat :=
  let temp := lst.reverse
  match temp with
  | [] => []
  | _ =>
    let rec aux : List Nat → Nat → List Nat
    | [], 0 => []
    | [], _ => [1]
    | x :: xs, i =>
      if x == 9 then 0 :: (aux xs 1)
      else (x + i) :: (aux xs 0)
    (aux temp 1).reverse

def increment : List Nat → List Nat
  | [] => []
  | xs =>
    let rec aux : List Nat → Nat → List Nat
    | [], 0 => []
    | [], _ => [1]
    | y :: ys, i =>
      if y == 9 then 0 :: (aux ys 1)
      else (y + i) :: (aux ys 0)
    (aux xs.reverse 1).reverse

#eval increment digits_1
#eval increment digits_2
