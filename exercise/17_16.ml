type eki_t = {
    namae : string; (* 駅名 *)
    saitan_kyori : float; (* 最短距離 *)
    temae_list : string list; (* 駅名のリスト *)
}

(* eki_t list型のリストを受け取ったら、「最短距離最小の駅」と「最短距離最小の駅以外からなるリスト」の組を返す *)
(* saitan_wo_bunri : eki_t -> eki_t list -> eki_t list *)
let rec saitan_wo_bunri eki eki_list = match eki_list with
    [] -> (eki, [])
  | first :: rest ->
        let (x, y) = saitan_wo_bunri first rest
        in match (eki, x) with
        ({namae=eki_name;saitan_kyori=eki_saitan_kyori;temae_list=eki_temae_list},
         {namae=x_name;saitan_kyori=x_saitan_kyori;temae_list=x_temae_list}) ->
            if eki_saitan_kyori < x_saitan_kyori then (eki, x :: y)
            else (x, eki :: y)

let eki1 = {namae="代々木上原"; saitan_kyori=2.; temae_list=[]}
let eki2 = {namae="代々木公園"; saitan_kyori=1.; temae_list=[]}
let eki3 = {namae="明治神宮前"; saitan_kyori=infinity; temae_list=[]}

let test1 = saitan_wo_bunri eki1 [] = (eki1, [])
let test2 = saitan_wo_bunri eki1 [eki2; eki3] = (eki2, [eki1; eki3])
