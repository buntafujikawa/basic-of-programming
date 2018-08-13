#use "8_2-4.ml"

(* リストの中から条件を満たす要素のみを取り出す *)
(* filter : ('a -> bool) -> 'a list -> 'a list *)
let rec filter p lst = match lst with
    [] -> []
    | first :: rest -> if p first then first :: filter p rest
                                  else filter p rest

(* evenをfilterを使って定義 *)
let is_even n = n mod 2 = 0
let filter_even list = filter is_even list

let test1 = filter_even [] = []
let test2 = filter_even [1; 2; 3; 4] = [2; 4]

(* count_Aをfilterとlengthを用いて定義 *)
let is_A person = match person with
    {name=name;height=height;weight=weight;month=month;day=day;blood_type=blood_type;}
    -> blood_type = "A"

let test1 = is_A person1 = true
let test2 = is_A person2 = false

let count_A persons = List.length (List.filter is_A persons)

let test1 = count_A [] = 0
let test2 = count_A [person1; person2] = 1
let test2 = count_A [person1; person2; person3; person4] = 2
