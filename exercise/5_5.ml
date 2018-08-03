(* 2次方程式の係数a,b,cを与えられたら、解の個数を返す *)
(* kainokosuu : float -> float -> float -> int *)
#use "5_4.ml"
let kainokosuu a b c = 
    if hanbetsushiki a b c > 0. then 2 
    else if hanbetsushiki a b c = 0. then 1
    else 0

let test1 = kainokosuu 1. 1. 1. = 0
let test2 = kainokosuu 1. 2. 1. = 1
let test3 = kainokosuu 1. 4. 1. = 2

