partial def binarySearch : Nat → Nat → List Nat → Nat → Nat
  | l, r, xs, t =>
    if l > r then 0
    else
      let m : Nat := l + (r - 1) / 2
      if xs.get! m = t then m
      else if (xs.get! m) < t then binarySearch (m + 1) r xs t
      else binarySearch l (m - 1) xs t

nonrec def search : List Nat → Nat → Nat
  | [],   _ => 0
  | x::_, 0 => x
  | xs, n =>
    binarySearch 0 xs.length xs n

#eval search [1, 2, 3, 4] 0
