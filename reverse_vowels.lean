def vowels : List Char := ['a', 'e', 'o', 'u', 'i']

def isVowel : Char → Bool
  | ch =>
    ch.isAlpha && vowels.contains ch.toLower

def test_2 := "leetcode"

def reverseVowels : String → String
  | "" => ""
  | s  =>
    let aux := Id.run do
      let mut temp := s.toList.toArray
      let mut i : Nat := 0
      let mut j : Nat := temp.size - 1

      while i != j do
        if (isVowel (temp.get! i)) && (isVowel (temp.get! j)) then
          let mut t := temp.get! i
          temp := temp.set! i (temp.get! j)
          temp := temp.set! j (t)
          i := i + 1
          j := j - 1
        else if isVowel (temp.get! i) then
          j := j - 1
        else if isVowel (temp.get! j) then
          i := i + 1
        else
          i := i + 1

      return temp.toList.toString
    aux

#eval reverseVowels test_2
