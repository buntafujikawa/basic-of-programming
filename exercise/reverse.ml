(* 与えられたリストを逆順にして返す *)
(* reverse : a' list -> a' list *)
let rec reverse lst =
    (* @resultを返す *)
    (* ここでresultはこれまでの要素を逆順にしたリストを返す *)
    let rec rev lst result = match lst with
        [] -> result
        | first :: rest -> rev rest (first :: result)
    in rev lst []

let test1 = reverse [] = []
let test2 = reverse [1] = [1]
let test3 = reverse [1; 2; 3; 4; 5] = [5; 4; 3; 2; 1]
