def lst_str  : List String := ["Hello,", " ", "World!", "Goodbye,", " ", "Mars!"]
def lst_nums : List Nat    := [1, 2, 3, 4]

def reverse_list : List α → List α
  | [] => []
  | x :: xs => (reverse_list xs) ++ [x]

def reverse_a_list : List α → List α
  | [] => []
  | xs => xs.foldl (λ acc x => [x] ++ acc) []

#eval reverse_list lst_str
#eval reverse_a_list lst_str

#eval reverse_list lst_nums
#eval reverse_a_list lst_nums

#eval Eq (reverse_a_list lst_str) (reverse_list lst_str)
#eval (reverse_a_list lst_nums) = (reverse_list lst_nums)
