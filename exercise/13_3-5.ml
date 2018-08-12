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

