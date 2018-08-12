#use "8_2-4.ml"

(* person_t型のリストを受け取ったら、その中から指定された血液型の人の数を返す *)
(* count_ketsueki : person_t list -> string -> int *)
let rec count_ketsueki person_list target_blood_type = match person_list with
    [] -> 0
    | {name=name;height=height;weight=weight;month=month;day=day;blood_type=blood_type;} :: rest ->
      if blood_type = target_blood_type then 1 + count_ketsueki rest target_blood_type
      else count_ketsueki rest target_blood_type

let person1 = { name = "鈴木";  height = 170.0; weight = 64.5; month = 1; day = 2; blood_type = "A" }
let person2 = { name = "田中";  height = 180.0; weight = 74.9; month = 2; day = 3; blood_type = "B" }
let person3 = { name = "佐藤";  height = 190.0; weight = 100.0; month = 3; day = 4; blood_type = "A" }

let test1 = count_ketsueki [person1; person2; person3] "A" = 2
let test1 = count_ketsueki [person1; person2; person3] "B" = 1
let test1 = count_ketsueki [person1; person2; person3] "O" = 0
