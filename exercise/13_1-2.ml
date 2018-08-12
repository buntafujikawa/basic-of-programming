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
let test2 = count_ketsueki [person1; person2; person3] "B" = 1
let test3 = count_ketsueki [person1; person2; person3] "O" = 0


(* person_t型の名前を返す *)
(* get_namae : person_t -> string *)
let get_namae person = match person with
     {name=name;height=height;weight=weight;month=month;day=day;blood_type=blood_type;} -> name

let test1 = get_namae person1 = "鈴木"

(* person_t型のリストを受け取ったら、その中に出てくる人の名前のリストを返す *)
(* person_namae : person_t list -> string list *)
let rec person_namae person_list = List.map get_namae person_list

let test1 = person_namae [] = []
let test2 = person_namae [person1] = ["鈴木"]
let test3 = person_namae [person1; person2; person3] = ["鈴木"; "田中"; "佐藤"]
