def test_1 := "leetcode"
def test_2 := "aabb"
def test_3 := "loveleetcode"

def firstUniqueChar : String → Int
  | "" => -1
  | s  =>
    let aux : Int := Id.run do
      let mut temp := s.toList
      let mut noDups := temp.eraseDups

      for i in [0:noDups.length] do
        if (temp.count (noDups.get! i)) == 1 then
          return i
      return -1

    aux

#eval firstUniqueChar test_3
