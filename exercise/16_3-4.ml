#use "10_10-11.ml"
#use "12_4.ml"
(*#use "14_11-13.ml"*)
(*#use "15_4.ml"*)

(* 直前に確定した駅pと未確定の駅のリストvを受け取ったら、必要な更新処理を行った後の未確定の駅のリストを返す(14.13を駅間のリストを引数で渡せるようにする) *)
(* koushin : eki_t -> eki_t list -> ekikan_t list -> eki_t list *)
let koushin eki v ekikan_list =
    List.map (
        (fun eki_p eki_q ->
            let {namae=p_namae; saitan_kyori=p_saitan_kyori; temae_list=p_temae_list} = eki_p in
            let {namae=q_namae; saitan_kyori=q_saitan_kyori; temae_list=q_temae_list} = eki_q in
            let kyori = get_ekikan_kyori p_namae q_namae ekikan_list in
            if kyori != infinity then
                if p_saitan_kyori < q_saitan_kyori then
                    {namae=q_namae; saitan_kyori=kyori +. p_saitan_kyori; temae_list=q_namae::p_temae_list}
                else eki_q
            else eki_q
        )
    eki) v

let test1 = koushin
    {namae="代々木公園"; saitan_kyori=1.0; temae_list=["代々木公園"; "代々木上原"]}
    [
        {namae="明治神宮前"; saitan_kyori=infinity; temae_list=[]};
    ] global_ekikan_list = [
        {namae="明治神宮前"; saitan_kyori=2.2; temae_list=["明治神宮前";"代々木公園"; "代々木上原"];};
    ]

let test2 = koushin
    {namae="代々木公園"; saitan_kyori=1.0; temae_list=["代々木公園"; "代々木上原"]}
    [
        {namae="明治神宮前"; saitan_kyori=infinity; temae_list=[]};
        {namae="表参道"; saitan_kyori=infinity; temae_list=[]};
    ] global_ekikan_list = [
        {namae="明治神宮前"; saitan_kyori=2.2; temae_list=["明治神宮前";"代々木公園"; "代々木上原"];};
        {namae="表参道"; saitan_kyori=infinity; temae_list=[];};
    ]

(* 駅のリストと駅間のリストを受け取ったら、ダイクストラのアルゴリズムに従って各駅について最短距離と最短経路が正しく入ったリストを返す *)
(* dijkstra_main : eki_t list -> ekikan_t list -> eki_t list *)
let rec dijkstra_main eki_list ekikan_list = match eki_list with
    [] -> []
    | first :: rest ->
        let (saitan, others) = saitan_wo_bunri (first :: rest)
        in let mikakutei_eki_list = koushin saitan others ekikan_list
        in saitan :: dijkstra_main mikakutei_eki_list ekikan_list

let eki_list = [
    {namae="池袋"; saitan_kyori = infinity; temae_list = []};
    {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]};
    {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]};
    {namae="後楽園"; saitan_kyori = infinity; temae_list = []};
]

let test1 = dijkstra_main [] global_ekikan_list = []
let test2 = dijkstra_main eki_list global_ekikan_list =[
    {namae = "茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]};
    {namae = "新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]};
    {namae = "後楽園"; saitan_kyori = 1.8; temae_list = ["後楽園"; "茗荷谷"]};
    {namae = "池袋"; saitan_kyori = 3.; temae_list = ["池袋"; "新大塚"; "茗荷谷"]}
]

(* 14_11-13 *)
let make_initial_eki_list ekimei_list kiten =
    List.map (fun ekimei -> match ekimei with
                | { kanji=kanji; kana=kana; romaji=romaji; shozoku=shozoku; }
                -> if kanji = kiten then {namae=kanji; saitan_kyori=0.; temae_list=[kanji]}
                                    else {namae=kanji; saitan_kyori=infinity; temae_list=[]}
                ) ekimei_list

(* 駅のリストから終点を探す *)
let rec find_shuten shuten eki_list = match eki_list with
    [] ->  {namae=""; saitan_kyori = infinity; temae_list = []}
    | ({namae=namae; saitan_kyori = saitan_kyori; temae_list = temae_list}) as first :: rest ->
    if namae = shuten then first
                      else find_shuten shuten rest

(* 始点の駅名と終点の駅名を受け取ったら最短経路を返す *)
(*dijkstra : string -> string -> eki_t *)
let dijkstra romaji_kiten romaji_shuten =
    let unique_ekimei_list = seiretsu global_ekimei_list
    in let kanji_kiten = romaji_to_kanji romaji_kiten global_ekimei_list
    in let kanji_shuten = romaji_to_kanji romaji_shuten global_ekimei_list
    in let eki_list = make_initial_eki_list unique_ekimei_list kanji_kiten
    in let eki_list2 = dijkstra_main eki_list global_ekikan_list
    in find_shuten kanji_shuten eki_list2

let test1 = dijkstra "sumiyoshi" "kinshicho" =
    {namae = "錦糸町"; saitan_kyori = 1.;temae_list = ["錦糸町"; "住吉"]}
let test2 = dijkstra "shibuya" "gokokuji" =
    {namae = "護国寺"; saitan_kyori = 9.8; temae_list = ["護国寺"; "江戸川橋"; "飯田橋"; "市ヶ谷"; "麹町"; "永田町";"青山一丁目"; "表参道"; "渋谷"]}
let test3 = dijkstra "myogadani" "meguro" =
    {namae = "目黒"; saitan_kyori = 12.7000000000000028; temae_list = ["目黒"; "白金台"; "白金高輪"; "麻布十番"; "六本木一丁目"; "溜池山王"; "永田町"; "麹町"; "市ヶ谷"; "飯田橋"; "後楽園"; "茗荷谷"]}
