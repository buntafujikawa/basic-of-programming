(*  *)
(* 距離と距離の合計を持っている型 *)
type distance_t = {
    kyori : float;
    total : float;
}

(* 先頭からリストの中の各点までの距離の合計を計算する *)
(* total_distance : distance_t list -> distance_t list *)
let rec total_distance lst =
    (* 先頭からリストの中の各点までの距離の合計を計算する *)
    (* ここでtotal0はこれまでの距離の合計 *)
    (* hojo : distance_t list -> float -> distance_t list *)
    let rec hojo lst total0 = match lst with
        [] -> []
        | {kyori=k; total=t} :: rest ->
            {kyori=k; total=total0 +. k} :: hojo rest (total0 +. k)
    in hojo lst 0.0

let test1 = total_distance [
    {kyori=0.3;total=0.};
    {kyori=0.9;total=0.};
    {kyori=1.3;total=0.};
    {kyori=0.8;total=0.};
] = [
    {kyori=0.3;total=0.3};
    {kyori=0.9;total=1.2};
    {kyori=1.3;total=2.5};
    {kyori=0.8;total=3.3};
]
