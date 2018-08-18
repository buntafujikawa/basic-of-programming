#use "10_10-11.ml"
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
