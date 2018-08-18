(* initから始めてlstの要素を左から順にfを施し込む *)
(* fold_left : ('a -> 'b-> 'a) -> 'a -> 'b list -> 'a *)
let rec fold_left f init list = match list with
    [] -> init
    | first :: rest -> fold_left f (f init first) rest

let test1 = fold_left (^) "" [] = ""
let test2 = fold_left (^) "" ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
