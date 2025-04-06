def containsDuplicates : List Nat → Bool
  | [] => true
  | xs =>
    xs.eraseDups.length == xs.length
