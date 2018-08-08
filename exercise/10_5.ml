#use "10_3.ml"

(* gakusei_t型のレコードを2つ受け取ったら、そのうち得点の大きい方のレコードを返す *)
(* high_score : gakusei_t -> gakusei_t -> gakusei_t *)
let high_score gakusei1 gakusei2 = match gakusei1 with
    { name = first_name; tensuu = first_tensuu; } -> match gakusei2 with
    { name = second_name; tensuu = second_tensuu; } ->
      if first_tensuu > second_tensuu then gakusei1 else gakusei2

let test1 = high_score gakusei1 gakusei2 = gakusei2
let test2 = high_score gakusei2 gakusei3 = gakusei3



(* gakusei_t型のレコードを受け取ったら、その中から最高得点をとった人のレコードを返す *)
(*
let rec gakusei_max gakusei_list = match gakusei_list with
    [] -> []
    | ({ name = first_name; tensuu = first_tensuu; } as first) :: rest
    -> if first_tensuu >= gakusei_max rest 
       then first_tensuu
       else gakusei_max rest

let test1 = gakusei_max [] = []
let test2 = gakusei_max [gakusei1; gakusei2; gakusei3] = [gakusei3]
*)
