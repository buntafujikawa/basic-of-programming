(* 'a -> 'a *)
let hoge1 fuga = fuga

(* 'a -> 'b -> 'a *)
let hoge2 fuga1 fuga2 = fuga1

(* 'a -> 'b -> 'b *)
let hoge3 fuga1 fuga2 = fuga2

(* 'a -> ('a -> 'b) -> 'b *)
let hoge4 fuga1 f = f fuga1

(* ('a -> 'b) -> ('b -> 'c) -> 'a -> 'c *)
let hoge2 f1 f2 x = f2 (f1 x)

let add3 x = x + 3;;
let times2 x = x * 2;;

(* 関数を2つ受け取ったら、その2つの関数を合成した関数を返す *)
(* compose : (int -> int) -> (int -> int) -> int -> int *)
let compose f1 f2 x = f1 (f2 x)

let test1 = compose times2 add3 4 = 14
