def example_5 : List Nat := [9, 3, 2, 10]
def example_6 : List Nat := [1, 2]
def example_7 : List Nat := [3, 7, 2]

partial def smashing (stones : List Nat) : Nat :=
  match stones with
  | [] => 0
  | x :: [] => x
  | xs =>
    let aux := Id.run do
      let mut lst := (List.mergeSort (xs)).reverse
      let stones_1 := lst.head!
      lst := lst.tail
      let stones_2 := lst.head!
      lst := lst.tail

      if stones_1 == stones_2 then
        return lst
      else if stones_1 < stones_2 then
        lst := (stones_2 - stones_1) :: lst
        return lst
      else
        lst := (stones_1 - stones_2) :: lst
        return lst

    smashing aux

#eval smashing example_5
#eval smashing example_6
#eval smashing example_7
