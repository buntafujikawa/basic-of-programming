(* リストの中から条件を満たす要素のみを取り出す *)
(* filter : ('a -> bool) -> 'a list -> 'a list *)
let rec filter p lst = match lst with
    [] -> []
    | first :: rest -> if p first then first :: filter p rest
                                  else filter p rest

(* evenをfilterを使って定義 *)
let is_even n = n mod 2 = 0
let filter_even list = filter is_even list

let test1 = filter_even [] = []
let test2 = filter_even [1; 2; 3; 4] = [2; 4]
