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

(* 整数のリストを受け取ったら、その中の偶数の要素のみを含むリストを返す *)
(* even : int list -> int list *)
let rec even list = match list with
    [] -> []
    | first :: rest ->
        if first mod 2 = 0 then first :: (even rest)
        else even rest

let test1 = even [] = []
let test2 = even [2; 1; 6; 4; 7] = [2; 6; 4]

(* 文字列のリストを受け取ったら、その中の要素を前から順に全部くっつけた文字列を返す *)
(* concat : string list -> string *)
let rec concat list = match list with
    [] -> ""
    | first :: rest -> first ^ concat rest

let test1 = concat [] = ""
let test2 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"

