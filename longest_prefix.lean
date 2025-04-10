def longestCommonPrefix (strs : List String) : String :=
  let n := strs.length
  if n == 0 then ""
  else
    let firstStr := strs.head!
    let firstStrLen := firstStr.length
    let initialPrefix : String := ""

    let charAtIndex (str : String) (i : Nat) : Option Char :=
      if i < str.length then
        str.get? ⟨i⟩
      else
        none

    let updatePrefix (pre : String) (i : Nat) : String :=
      match (firstStr.get? ⟨i⟩) with
      | none => pre
      | some char =>
        let allMatch := strs.all (λ str => (charAtIndex str i) == some char)
        if allMatch then
          pre ++ String.mk [char]
        else
          pre

    List.foldl updatePrefix initialPrefix (List.range firstStrLen)

#eval longestCommonPrefix ["flower", "flow", "flight"]  -- Output: "fl"
#eval longestCommonPrefix ["dog", "racecar", "car"]    -- Output: ""
#eval longestCommonPrefix ["interspecies", "interstellar", "interstate"] -- Output: "inter"
#eval longestCommonPrefix ["abc", "abcd", "ab"]         -- Output: "ab"
#eval longestCommonPrefix ["ac", "aa"]
#eval longestCommonPrefix ["aaa", "aa", "aaa"]
