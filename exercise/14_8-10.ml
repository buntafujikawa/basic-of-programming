(* 整数を受け取ってきたら、その2乗から1を引いた数を返す *)
let square_minus_one = fun num -> num * num - 1

let test1 = square_minus_one 1 = 0
let test2 = square_minus_one 3 = 8
