(* 鶴の数と亀の数を与えられたら、足の数の合計を返す *)
(* tsurukame_no_ashi : int -> int -> int *)
#use "4_6.ml"

let tsurukame_no_ashi tsuru_num kame_num = tsuru_no_ashi tsuru_num + kame_no_ashi kame_num

let test1 = tsurukame_no_ashi 1 1 = 6
let test2 = tsurukame_no_ashi 0 1 = 4
let test3 = tsurukame_no_ashi 1 0 = 2

