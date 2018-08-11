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

(* 自然数mとnを受け取ったらmのn乗を返す *)
(* power : int -> int -> int *)
let rec power m n =
    if n = 0 then 1
             else m * power m (n -1)

let test1 = power 3 0 = 1
let test2 = power 3 1 = 3
let test3 = power 3 2 = 9
let test4 = power 3 3 = 27
