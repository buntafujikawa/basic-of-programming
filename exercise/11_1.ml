(* 0から受け取った自然数までの2乗の和を求める *)
(* sum_of_square : int -> int *)
let rec sum_of_square n =
    if n = 0 then 0
    else n * n + sum_of_square (n -1)

let test1 = sum_of_square 0 = 0
let test2 = sum_of_square 2 = 5
let test3 = sum_of_square 4 = 30

(* 漸化式で定義され得る数列のnを求める *)
(* a : int *)
let rec a n =
    if n = 0 then 3
    else 2 * (a (n -1)) - 1

let test1 = a 0 = 3
let test2 = a 1 = 5
let test3 = a 2 = 9
