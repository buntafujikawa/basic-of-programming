type person_t = {
    name : string;
    height : float;
    weight : float;
    month : int;
    day : int;
    blood_type : string;
}

(* person_t型のデータリストを受け取ったら、各血液型の人が何人いるかを組にして返す *)
(* ketsueki_shukei : person_t list -> int * int * int * int *)
let rec ketsueki_shukei person_list = match person_list with
    [] -> (0,0,0,0)
    | {name=name;height=height;weight=weight;month=month;day=day;blood_type=blood_type;} :: rest ->
    let (a, b, ab, o) = ketsueki_shukei rest in
    if blood_type = "A" then (a + 1, b, ab, o)
    else if blood_type = "B" then (a, b + 1, ab, o)
    else if blood_type = "AB" then (a, b, ab + 1, o)
    else if blood_type = "O" then (a, b, ab, o + 1)
    else (a, b, ab, o)

let person1 = { name = "鈴木";  height = 170.0; weight = 64.5; month = 1; day = 2; blood_type = "A" }
let person2 = { name = "田中";  height = 180.0; weight = 74.9; month = 2; day = 3; blood_type = "B" }
let person3 = { name = "佐藤";  height = 190.0; weight = 100.0; month = 3; day = 4; blood_type = "A" }
let person4 = { name = "佐藤";  height = 190.0; weight = 100.0; month = 3; day = 4; blood_type = "B" }

let test1 = ketsueki_shukei [] = (0,0,0,0)
let test2 = ketsueki_shukei [person1] = (1,0,0,0)
let test3 = ketsueki_shukei [person1; person2; person3] = (2,1,0,0)


(* person_t型のデータのリストを受け取ったら、4つの血液型のうち最も人気の多かった血液型を返す *)
(* saita_ketsueki : person_t list -> string *)
let saita_ketsueki person_list =
    let (a,b,ab,o) = ketsueki_shukei person_list in
        if a >= b && a >= ab && a >= o then "A"
        else if b >= a && b >= ab && b >= o then "B"
        else if ab >= a && ab >= b && ab >= o then "AB"
        else "O"

let test1 = saita_ketsueki [] = "A"
let test2 = saita_ketsueki [person1; person2] = "A"
let test3 = saita_ketsueki [person1; person2; person4] = "B"
