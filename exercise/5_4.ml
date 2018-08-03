(* 2次方程式ax2 + bx + c =0の係数a,b,cを与えられたら判別式の値を返す *)
(* hanbetsushiki : float -> float -> float -> float *)
let hanbetsushiki a b c = b ** 2. -. 4. *. a *. c

let test1 = hanbetsushiki 1. 1. 1. = -3.
let test2 = hanbetsushiki 1. 2. 1. = 0.
let test3 = hanbetsushiki 1. 4. 1. = 12.

