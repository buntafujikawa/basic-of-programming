#use "10_10-11.ml"
#use "12_4.ml"
#use "16_3-4.ml"

let insert_ekikan ekikan_tree ekikan = match ekikan with
    {kiten=kiten; shuten=shuten; keiyu=keiyu; kyori=kyori; jikan=jikan} ->
      insert_shuten_ekikan (insert_shuten_ekikan ekikan_tree shuten kiten kyori) kiten shuten kyori

let inserts_ekikan ekikan_tree ekikan_list =
    List.fold_left insert_ekikan ekikan_tree ekikan_list

(* 駅名二つとekikan_tree_t型の木を受け取ってきたら、その2駅間の距離を返す *)
(* get_ekikan_kyori : string -> string -> ekikan_tree_t -> float *)
let rec get_ekikan_kyori eki1 eki2 ekikan_tree = match ekikan_tree with
    Empty -> infinity
    | Node (left, ekimei, list , right) ->
        if eki1 < ekimei then get_ekikan_kyori eki1 eki2 left
        else if  eki1 > ekimei then get_ekikan_kyori eki1 eki2 right
        else assoc eki2 list

let ekikan_tree = inserts_ekikan Empty global_ekikan_list
let test1 = get_ekikan_kyori "茗荷谷" "新大塚" ekikan_tree = 1.2
let test2 = get_ekikan_kyori "表参道" "代々木公園" ekikan_tree = infinity


(* koushin : eki_t -> eki_t list -> ekikan_tree_t -> eki_t list *)
let koushin eki v ekikan_tree =
    List.map (
            (fun eki_p eki_q ->
                let {namae=p_namae; saitan_kyori=p_saitan_kyori; temae_list=p_temae_list} = eki_p in
                let {namae=q_namae; saitan_kyori=q_saitan_kyori; temae_list=q_temae_list} = eki_q in
                (* ここをekikan_treeに変更する *)
                let kyori = get_ekikan_kyori p_namae q_namae ekikan_tree in
                if kyori != infinity then
                    if p_saitan_kyori < q_saitan_kyori then
                        {namae=q_namae; saitan_kyori=kyori +. p_saitan_kyori; temae_list=q_namae::p_temae_list}
                    else eki_q
                else eki_q
            )
        eki) v

(* dijkstra_main : eki_t list -> ekikan_tree_ -> eki_t list *)
let rec dijkstra_main eki_list ekikan_tree = match eki_list with
    [] -> []
    | first :: rest ->
        let (saitan, others) = saitan_wo_bunri (first :: rest)
        in let mikakutei_eki_list = koushin saitan others ekikan_tree
        in saitan :: dijkstra_main mikakutei_eki_list ekikan_tree

(* find : string -> eki_t list -> eki_t *)
let rec find shuten eki_list = match eki_list with
    [] -> {namae = ""; saitan_kyori = infinity; temae_list = []}
  | ({namae = n; saitan_kyori = s; temae_list = t} as first) :: rest ->
      if n = shuten then first else find shuten rest

(*dijkstra : string -> string -> eki_t *)
let dijkstra romaji_kiten romaji_shuten =
    let unique_ekimei_list = seiretsu global_ekimei_list
    in let kanji_kiten = romaji_to_kanji romaji_kiten global_ekimei_list
    in let kanji_shuten = romaji_to_kanji romaji_shuten global_ekimei_list
    in let eki_list = make_initial_eki_list unique_ekimei_list kanji_kiten
    in let ekikan_tree = inserts_ekikan Empty global_ekikan_list
    in let eki_list2 = dijkstra_main eki_list ekikan_tree
    in find_shuten kanji_shuten eki_list2

let test1 = dijkstra "sumiyoshi" "kinshicho" =
    {namae = "錦糸町"; saitan_kyori = 1.;temae_list = ["錦糸町"; "住吉"]}
let test2 = dijkstra "shibuya" "gokokuji" =
    {namae = "護国寺"; saitan_kyori = 9.8; temae_list = ["護国寺"; "江戸川橋"; "飯田橋"; "市ヶ谷"; "麹町"; "永田町";"青山一丁目"; "表参道"; "渋谷"]}
let test3 = dijkstra "myogadani" "meguro" =
    {namae = "目黒"; saitan_kyori = 12.7000000000000028; temae_list = ["目黒"; "白金台"; "白金高輪"; "麻布十番"; "六本木一丁目"; "溜池山王"; "永田町"; "麹町"; "市ヶ谷"; "飯田橋"; "後楽園"; "茗荷谷"]}
