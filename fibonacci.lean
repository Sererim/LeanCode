def fibonacci (n : Nat) : Nat :=
  if n < 2 then 1
  else fibonacci (n - 2) + fibonacci (n - 1)

#check (fibonacci)

#eval 8 == fibonacci 5
