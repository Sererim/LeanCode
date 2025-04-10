def ransomNote_1 : String := "a"
def magazine_1   : String := "b"

def ransomNote_2 : String := "aa"
def magazine_2   : String := "ab"

def ransomNote_3 : String := "aa"
def magazine_3   : String := "aab"


def canConstruct : String → String → Bool
  | "", "" => true
  | "", _  => true
  | _, ""  => false
  | r, m   =>
    let rec aux : List Char → List Char → Bool
    | [], [] => false
    | [], _  => true
    | _,  [] => false
    | x :: xs, ys =>
      if ys.contains x then aux xs ys
      else false
    aux r.toList m.toList

#eval canConstruct ransomNote_1 magazine_1
#eval canConstruct ransomNote_2 magazine_2
#eval canConstruct ransomNote_3 magazine_3
