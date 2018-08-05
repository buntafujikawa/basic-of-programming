(* gakusei_t型のリストを受け取ったら、それをtensuuフィールドの順に整列したリストを返す *)
type gakusei_t = {
    name : string;
    tensuu : int;
}

(* tensuuフィールドを基準に昇順に並んでいるgakusei_tのリストとgakusei_tを受け取ったら、昇順となる位置にgakusei_tを挿入したリストを返す *)
(* insert_gakusei : gakusei_t liset -> gakusei_t -> gakusei_t list *)
let rec insert_gakusei gakusei_list gakusei = match gakusei_list with
    [] -> [gakusei]
    | ({ name = first_name; tensuu = first_tensuu; } as first) :: rest -> match gakusei with
    { name = addition_name; tensuu = addition_tensuu; } -> 
        if addition_tensuu <= first_tensuu then gakusei :: first :: rest
        else first :: insert_gakusei rest gakusei

let gakusei1 = { name = "山田"; tensuu = 1;}
let gakusei2 = { name = "田中"; tensuu = 2;}
let gakusei3 = { name = "鈴木"; tensuu = 3;}
let gakusei4 = { name = "佐藤"; tensuu = 4;}

let test_list = [gakusei2; gakusei3]
let test1 = insert_gakusei test_list gakusei1 = [gakusei1; gakusei2; gakusei3]
let test2 = insert_gakusei test_list gakusei2 = [gakusei2; gakusei2; gakusei3]
let test3 = insert_gakusei test_list gakusei4 = [gakusei2; gakusei3; gakusei4]

