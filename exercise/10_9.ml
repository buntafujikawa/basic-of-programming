(* ふたつのリストを受け取ってきたら、それらの長さが同じかどうかを判定する *)
(* equal_length : int list -> bool *)
let rec equal_length list1 list2 = match (list1, list2) with
    ([], []) -> true
    | ([], first2 :: rest2) -> false
    | (first1 :: rest1, []) -> false
    | (first1 :: rest1, first2 :: rest2) -> equal_length rest1 rest2

let test1 = equal_length [] [] = true
let test2 = equal_length [1] [] = false
let test3 = equal_length [] [1] = false
let test4 = equal_length [1] [2] = true
let test5 = equal_length [1; 2] [2] = false
