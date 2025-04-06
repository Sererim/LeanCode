partial def buzzer : Nat → Nat → List String
  | i, n =>
    if i == n then []
    else if (i % 3 == 0) && (i % 5 == 0) then "FizzBuzz" :: buzzer (i + 1) n
    else if (i % 3 == 0) then "Fizz" :: buzzer (i + 1) n
    else if (i % 5 == 0) then "Buzz" :: buzzer (i + 1) n
    else s!"{i}" :: buzzer (i + 1) n

def fizzbuzz (n : Nat) : List String :=
  match n with
  | 0 => []
  | _ =>
    buzzer 1 (n + 1)

#eval fizzbuzz 100
