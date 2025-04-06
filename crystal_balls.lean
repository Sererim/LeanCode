def height : List Bool := [false, false, false, false, false, false, true, true, true]

partial def find : List Bool → Nat → Nat
  | [],   _ => 0
  | xs, idx =>
    if xs.lengthTR == idx then 0
    else
      if xs[idx]! then idx
      else find xs (idx + 1)

def breaks (floors : List Bool) : Nat :=
  let jump := floors |>.length |>.toFloat |>.sqrt |>.floor |>.toInt32 |>.toNatClampNeg
  let rec aux : List Bool → Nat → Nat → Nat
    | [], _, _ => 0
    | x :: xs, i, move =>
      if x then i
      else (aux xs i move) + 1

  let idx := (aux floors 0 jump) - jump

  find floors idx

#eval breaks height
