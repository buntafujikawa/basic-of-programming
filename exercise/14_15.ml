(* nから1までのリストを作る *)
(* enumerate : int -> int list *)
let rec enumerate n =
    if n = 0 then [] else n :: enumerate (n -1)

let test1 = enumerate 5 = [5; 4; 3; 2; 1]

(* nの約数のリストを返す *)
(* divisor : int -> int list *)
let divisor n = List.filter (fun x -> n mod x = 0) (enumerate n)

let test1 = divisor 24 = [24; 12; 8; 6; 4; 3; 2; 1]

(* m以下の完全数のリストを返す *)
(* perfect : int -> int list *)
let perfect m =
    List.filter (fun n -> fold_right (+) (divisor n) 0 - n = n) (enumerate m)

(* 1から受け取った自然数までの合計を求める *)
(* one_to_n : int -> int *)
let one_to_n n = List.fold_right (+) (enumerate n) 0

let test1 = one_to_n 1 = 1
let test2 = one_to_n 5 = 15

(* 階乗を求める *)
(* fac : int -> int *)
let fac n = List.fold_right ( * ) (enumerate n) 1

let test1 = fac 1 = 1
let test2 = fac 5 = 120
