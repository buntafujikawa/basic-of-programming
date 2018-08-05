(* 受け取ったlstの中の最小値を返す *)
(* minimum : int list -> int *)
let rec minimum lst = match lst with
    [] -> max_int
    | first :: rest ->
    if first <= minimum rest
      then first
      else minimum rest

let test1 = minimum [] = max_int
let test2 = minimum [5; 6; 3; 1; 4] = 1
let test3 = minimum [-1; 0; 1] = -1

