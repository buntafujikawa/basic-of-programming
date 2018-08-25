#use "8_2-4.ml"

(* person_t型のリストを受け取ったら、その中から最初のA型の人のレコードをオプション型で返す *)
(* first_A : person_t list -> person_t option *)
let rec first_A person_list = match person_list with
    [] -> None
  | ({name=name;height=height;weight=weight;month=month;day=day;blood_type=blood_type}) as first :: rest ->
    if blood_type = "A" then Some first
    else first_A rest

let personA = { name = "鈴木";  height = 170.0; weight = 64.5; month = 1; day = 2; blood_type = "A" }
let personB = { name = "田中";  height = 180.0; weight = 74.9; month = 2; day = 3; blood_type = "B" }
let personAB = { name = "佐藤";  height = 190.0; weight = 100.0; month = 3; day = 4; blood_type = "AB" }

let test1 = first_A [personB] = None
let test2 = first_A [personB; personAB; personA] = Some personA
