(* つると亀の数の合計と足の数の合計を与えられたら、鶴の数を返す *)
(* tsurukame : int -> int *)

let tsurukame head_count leg_count = (head_count * 4 - leg_count) / 2

let test1 = tsurukame 0 0 = 0
let test2 = tsurukame 1 2 = 1
let test3 = tsurukame 1 4 = 0
let test4 = tsurukame 10 28 = 6
