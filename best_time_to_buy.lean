-- You are given an integer array prices where prices[i] is the price of NeetCoin on the ith day.
-- You may choose a single day to buy one NeetCoin and choose a different day in the future to sell it.
-- Return the maximum profit you can achieve. You may choose to not make any transactions, in which case the profit would be 0.

def example_1 : List Nat := [10, 1, 5, 6, 7, 1]
def example_2 : List Nat := [10, 8, 7, 5, 2]
def example_3 : List Nat := [7, 1, 5, 6, 3, 4]


def bestTimeToBuy (prices : List Nat) : Nat :=
  match prices with
  | [] => 0
  | xs => Id.run do
    let mut maxProfit : Nat := 0
    let mut minPrice  := xs[0]!
    for i in xs do
      maxProfit := max maxProfit (i - minPrice)
      minPrice  := min minPrice i
    return maxProfit

#eval bestTimeToBuy example_1
#eval bestTimeToBuy example_3
