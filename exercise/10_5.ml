(* gakusei_t型のレコードを受け取ったら、その中から最高得点をとった人のレコードを返す *)
(* gakusei_max : gakusei_t list -> gakusei_t *)
#use "10_3.ml"

let gakusei_max gakusei_list = match gakusei_list with
    [] -> []
    | ({ name = first_name; tensuu = first_tensuu; } as first) :: rest
    -> if first_tensuu >= gakusei_max rest 
       then first_tensuu
       else gakusei_max rest

let test1 = gakusei_max [] = []
let test2 = gakusei_max [gakusei1; gakusei2; gakusei3] = [gakusei3]

