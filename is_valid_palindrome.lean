def palindrome : String := "A man, a plan, a canal: Panama"

def stripNotAlphanumeric : List Char → List Char
  | [] => []
  | x :: xs =>
    if x.isAlphanum then x.toLower :: stripNotAlphanumeric xs
    else stripNotAlphanumeric xs

def isValid : String → Bool
  | "" => true
  | s  =>
    let rev := stripNotAlphanumeric s.toList.reverse
    let rec aux : List Char → List Char → Bool
      | [], [] => true
      | [], _  => false
      | _,  [] => false
      | x :: xs, y :: ys =>
        if x = y then aux xs ys
        else false
    aux (stripNotAlphanumeric s.toList) rev

#eval isValid palindrome
