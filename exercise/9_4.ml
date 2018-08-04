(* int listは
    - [] 空リスト、あるいは
    - first :: rest 最初の要素がfirstで残りのリストがrest(restが自己参照のケース)
    という形*)
(* 受け取ったリストの長さを返す *)
(* length : int list -> int *)
let rec length list = match list with
    [] -> 0
    | first :: rest -> 1 + length rest

let test1 = length [] = 0
let test2 = length [1] = 1
let test3 = length [1; 5; 6; 9; 3] = 5

