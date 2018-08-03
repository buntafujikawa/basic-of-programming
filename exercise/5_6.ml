(* 2次方程式の係数a,b,cを与えられたら、この2時方程式が虚数解を持つかどうかを判定する *)
(* kyosuukai : float -> float -> float -> bool *)
#use "5_5.ml"
let kyosuukai a b c = kainokosuu a b c = 0

let test1 = kyosuukai 1. 1. 1. = true
let test2 = kyosuukai 1. 2. 1. = false
let test3 = kyosuukai 1. 4. 1. = false

