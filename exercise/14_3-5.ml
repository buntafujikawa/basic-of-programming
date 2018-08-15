#use "10_3.ml"

(* initから始めてlstの要素を右から順にfを施し込む *)
(* fold_right : ('a -> 'b-> 'b) -> 'a list -> 'b -> 'b *)
let rec fold_right f lst init = match lst with
    [] -> init
    | first :: rest -> f first (fold_right f rest init)

(* 文字列のリストを受け取ったら、その中の要素を前から順に全部くっつけた文字列を返す *)
(* concat : string list -> string *)
let concat_two_string first second = first ^ second
let concat list =
    let concat_two_string first second = first ^ second in
    List.fold_right concat_two_string list ""

let test1 = concat [] = ""
let test2 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"

(* gakusei_t型のリストを受け取ったら、全員の得点の合計を返す *)
(* gakusei_sum : gakusei_t list -> int *)
let gakusei_sum gakusei_list =
    let sum first second =
        let { name = first_name; tensuu = first_tensuu; } = first in
        first_tensuu + second in
        List.fold_right sum gakusei_list 0

let test1 = gakusei_sum [] = 0
let test2 = gakusei_sum [gakusei1; gakusei2; gakusei3] = 6
