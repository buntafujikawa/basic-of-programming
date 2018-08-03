(* 身長と体重を与えられたら、BMIを計算し、その数値によって体型を返す *)
(* taikei : float -> float -> string *)
#use "4_4.ml"

let taikei height weight = 
    if bmi height weight < 18.5 then "やせ"
    else if 18.5 <= bmi height weight && bmi height weight < 25. then "標準"
    else if 25. <= bmi height weight && bmi height weight < 30. then "肥満"
    else "高度肥満"

let test1 = taikei 1.7 53. = "やせ"
let test2 = taikei 1.7 64. = "標準"
let test2 = taikei 1.7 73. = "肥満"

