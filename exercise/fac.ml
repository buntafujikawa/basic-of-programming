(* 自然数nの階上を求める *)
(* fac : int -> int *)
let rec fac n =
    if n = 0 then 1
             else n * fac (n - 1)

let test1 = fac 0 = 1
let test2 = fac 1 = 1
let test3 = fac 2 = 2
let test4 = fac 3 = 6
let test5 = fac 10 = 3628800
