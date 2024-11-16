-- Given an integer array nums, return true if any value appears more than once in the array, otherwise return false.

def nums_distinct : Array Int := #[1, 2, 3, 4, 5]

def nums_copies   : Array Int := #[1, 2, 3, 3, 5]

#eval nums_distinct.allDiff

#eval nums_copies.allDiff
