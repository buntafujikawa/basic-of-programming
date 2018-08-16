#use "10_7-8.ml"

(* 整数を受け取ってきたら、その2乗から1を引いた数を返す *)
let square_minus_one = fun num -> num * num - 1

let test1 = square_minus_one 1 = 0
let test2 = square_minus_one 3 = 8

(* person_t型のデータを受け取ってきたら、その名前フィールドを取り出す *)
let get_name = fun person -> match person with
    {name=name;height=height;weight=weight;month=month;day=day;blood_type=blood_type;} -> name

let test1 = get_name person1 = "鈴木"
let test2 = get_name person2 = "田中"
