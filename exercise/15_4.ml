#use "12_1-3.ml"

(* 最短距離最小の駅を求める *)
let saitan eki_list = List.fold_right (
    fun x y ->
        let {namae=x_namae; saitan_kyori=x_saitan_kyori; temae_list=x_temae_list} = x
        in let {namae=y_namae; saitan_kyori=y_saitan_kyori; temae_list=y_temae_list} = y
        in if x_saitan_kyori < y_saitan_kyori then x else y
) eki_list {namae=""; saitan_kyori=infinity; temae_list=[]}

let test1 = saitan [
    {namae="代々木上原"; saitan_kyori=2.; temae_list=[]};
    {namae="代々木公園"; saitan_kyori=1.; temae_list=[]};
    {namae="明治神宮前"; saitan_kyori=infinity; temae_list=[]};
] = ({namae="代々木公園"; saitan_kyori=1.; temae_list=[]})

(* そこでも止まった駅を未確定の駅のリストから取り除く *)
let remove_saitan_eki saitan_eki eki_list = List.filter (fun eki -> eki <> saitan_eki) eki_list

let test1 = remove_saitan_eki
    {namae="代々木公園"; saitan_kyori=1.; temae_list=[]}
    [
        {namae="代々木上原"; saitan_kyori=2.; temae_list=[]};
        {namae="代々木公園"; saitan_kyori=1.; temae_list=[]};
        {namae="明治神宮前"; saitan_kyori=infinity; temae_list=[]};
    ] =
    [
        {namae="代々木上原"; saitan_kyori=2.; temae_list=[]};
        {namae="明治神宮前"; saitan_kyori=infinity; temae_list=[]};
    ]

(* eki_t list型のリストを受け取ったら、「最短距離最小の駅」と「最短距離最小の駅以外からなるリスト」の組を返す *)
(* saitan_wo_bunri : eki_t list -> eki_t list *)
let saitan_wo_bunri eki_list =
    let saitan_eki = saitan eki_list
    in let eki_list_excluding_saitan = remove_saitan_eki saitan_eki eki_list
    in (saitan_eki, eki_list_excluding_saitan)

let test1 = saitan_wo_bunri [
    {namae="代々木上原"; saitan_kyori=2.; temae_list=[]};
    {namae="代々木公園"; saitan_kyori=1.; temae_list=[]};
    {namae="明治神宮前"; saitan_kyori=infinity; temae_list=[]};
] = (
    {namae="代々木公園"; saitan_kyori=1.; temae_list=[]},
    [
        {namae="代々木上原"; saitan_kyori=2.; temae_list=[]};
        {namae="明治神宮前"; saitan_kyori=infinity; temae_list=[]};
    ]
)
