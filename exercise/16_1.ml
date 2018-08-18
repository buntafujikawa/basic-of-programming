(* 整数のリストを受け取ったら、それまでの数の合計からなるリストを返す *)
(* sum_list : int list -> int list *)
let sum_list list =
    (* 先頭からリストの中の値を加算する *)
    (* total0はこれまでの合計 *)
    let rec sum list total0 = match list with
        [] -> []
        | first :: rest -> first + total0 :: sum rest (first + total0)
    in sum list 0

let test1 = sum_list [] = []
let test2 = sum_list [1] = [1]
let test3 = sum_list [3; 2; 1; 4] = [3; 5; 6; 10]
