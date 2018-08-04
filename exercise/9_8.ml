(* person_t型のデータのリストを受け取ったら、乙女座の人の名前のみからなるリストを返す *)
(* otomeza : person_t list -> string list *)
#use "5_3.ml"
#use "8_3.ml"

let rec otomeza persons = match persons with
    [] -> []
    | { name : string;  height : float; weight : float; month : int; day : int; blood_type : string; } :: rest
    -> if seiza month day = "おとめ座" then name :: otomeza rest
       else otomeza rest

let test1 = otomeza [] = []
let test2 = otomeza [person1; person2; person3] = []
let test3 = otomeza [
    { name = "藤川";  height = 190.0; weight = 100.0; month = 8; day = 30; blood_type = "AB" };
    { name = "藤田";  height = 190.0; weight = 100.0; month = 9; day = 20; blood_type = "AB" };
    { name = "藤山";  height = 190.0; weight = 100.0; month = 1; day = 1; blood_type = "AB" }
] = ["藤川"; "藤田"]

