(* 受け取ったlstの中の最小値を返す *)
(* minimum : int -> int list -> int *)
let rec minimum n lst = match lst with
    [] -> n
  | first :: rest ->
        let rest_min = minimum first rest in
        if n <= rest_min then n
        else rest_min

let test1 = minimum 1 [] = 1
let test2 = minimum 3 [5; 6; 3; 1; 4] = 1
let test3 = minimum 1 [5; 4; 2] = 1
