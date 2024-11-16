-- Given two strings s and t, return true if the two strings are anagrams of each other, otherwise return false.
-- An anagram is a string that contains the exact same characters as another string, but the order of the characters can be different.

def s_1 : String := "racecar"

def t_1 : String := "carrace"

def s_2 : String := "jar"

def t_2 : String := "jam"

def get_list_of_chars (word : String) : List Char :=
  word.toList.mergeSort

#eval get_list_of_chars s_1 = get_list_of_chars t_1
#eval get_list_of_chars s_2 = get_list_of_chars t_2
