-- Cool function ! ! !
def listOfRange (start : Nat) (finish : Nat) : List Nat := Id.run do
  let mut lst : List Nat := []
  for i in [start:finish] do
    lst := lst.append [i]
  return lst
