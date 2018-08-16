(* ふたつの自然数を受け取ったら、その最大公約数を返す *)
(* gcd : int -> int -> int *)
let rec gcd m n =
    if n = 0 then m
             else gcd n (m mod n)

let test1 = gcd 1 0 = 1
let test2 = gcd 6 2 = 2
let test3 = gcd 1071 1029 = 21
