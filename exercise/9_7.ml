(* person_t型のデータのリストを受け取ったら、血液型がA型の人の数を返す *)
(* count_ketsueki_A : person_t list -> int *)
#use "8_2-4.ml"

let rec count_ketsueki_A persons = match persons with
    [] -> 0;
    | { name : string;  height : float; weight : float; month : int; day : int; blood_type : string; } :: rest
    -> if blood_type = "A" then 1 + count_ketsueki_A rest
       else count_ketsueki_A rest

let test1 = count_ketsueki_A [] = 0
let test2 = count_ketsueki_A [person1; person2; person3] = 1

