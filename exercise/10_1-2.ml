(* 昇順に並んでいる整数のリストと整数を受け取ったら、昇順となる位置に整数を挿入したリストを返す *)
(* int list -> int -> int list *)
let rec insert lst num = match lst with
    [] -> [num]
    | first :: rest 
    -> if num <= first then num :: first :: rest
       else first :: insert rest num

let test1 = insert [1] 1 = [1; 1]
let test2 = insert [1; 2; 5; 8] 3 = [1; 2; 3; 5; 8]
let test3 = insert [1; 2; 3] (-1) = [-1; 1; 2; 3]

(* 整数のリストを受け取ったら、それを昇順に整列したリストを返す *)
(* int list -> int list *)
let ins_sort lst = match lst with
    [] -> []
    | first :: rest -> insert (ins_sort rest) first

let test1 = ins_sort [] = []
let test2 = ins_sort [1; 3; 2] = [1; 2; 3]
let test3 = ins_sort [1; 1; -1] = [-1; 1; 1]

