inductive BinTree (α : Type) where
  | leaf
  | branch : BinTree α → α → BinTree α → BinTree α
deriving Repr, BEq, Hashable

instance : Coe (Unit) (BinTree α) where
  coe
    | _ => BinTree.leaf

--- Let's use a BinTree
def tree : BinTree Int := BinTree.branch
  (BinTree.branch (BinTree.branch () 1 ()) 2 (BinTree.branch () 3 ()))
    4
  (BinTree.branch (BinTree.branch () 5 ()) 7 (BinTree.branch () 6 ()))


def depth : BinTree α → Nat
  | .leaf => 0
  | .branch l _ r =>
    let left  := depth l + 1
    let right := depth r + 1
    if left > right then left
    else right

#eval depth tree

-- [3, 9, null, null, 20, 15, 7]
-- 3

def testTree : BinTree Nat := BinTree.branch
  (BinTree.branch () 9 ())
  3
  (BinTree.branch (BinTree.branch () 15 ()) 20 (BinTree.branch () 7 ()))

#eval depth testTree
