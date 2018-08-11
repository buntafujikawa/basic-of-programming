#use "10_3.ml"

(* gakusei_t型のレコードを受け取ったら、その中から最高得点をとった人のレコードを返す *)
(* gakusei_max : gakusei_t list -> gakusei_t *)
let rec gakusei_max gakusei_list = match gakusei_list with
    [] -> { name = ""; tensuu = min_int }
    | first :: rest -> let tmp_max = gakusei_max rest in match tmp_max with
        { name = first_name; tensuu = first_tensuu } -> match first with
            { name = second_name; tensuu = second_tensuu } ->
                if first_tensuu > second_tensuu then tmp_max else first

let test1 = gakusei_max [] = { name = ""; tensuu = min_int }
let test2 = gakusei_max [gakusei1; gakusei2; gakusei3] = gakusei3
