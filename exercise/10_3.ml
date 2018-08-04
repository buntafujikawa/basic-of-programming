(* gakusei_t型のリストを受け取ったら、それをtensuuフィールドの順に整列したリストを返す *)
(* gakusei_sort : gakusei_t list -> gakusei_t list *)
type gakusei_t = {
    name : string;
    tensuu : int;
}

let gakusei1 = { name = "山田"; tensuu = 60 }
let gakusei2 = { name = "鈴木"; tensuu = 70 }
let gakusei3 = { name = "田中"; tensuu = 30 }

let gakusei_sort lst = match lst with
    [] -> []
    | first :: rest -> 

let test1 = gakusei_sort [gakusei1] = [gakusei1]
let test2 = gakusei_sort [gakusei1; gakusei2; gakusei3] = [gakusei3; gakusei1; gakusei3]

