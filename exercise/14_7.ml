#use "10_10-11.ml"

(* 直前に確定した駅pと未確定の駅のリストvを受け取ったら、必要な更新処理を行った後の未確定の駅のリストを返す(13.7を局所関数とする) *)
(* koushin : eki_t -> eki_t list -> eki_t list *)
let koushin eki v =
    let koushin1 eki_p eki_q =
        let {namae=p_namae; saitan_kyori=p_saitan_kyori; temae_list=p_temae_list} = eki_p in
        let {namae=q_namae; saitan_kyori=q_saitan_kyori; temae_list=q_temae_list} = eki_q in
        let kyori = get_ekikan_kyori p_namae q_namae global_ekikan_list in
        if kyori != infinity then
            if p_saitan_kyori < q_saitan_kyori then
                {namae=q_namae; saitan_kyori=kyori +. p_saitan_kyori; temae_list=q_namae::p_temae_list}
            else eki_q
        else eki_q in
    List.map (koushin1 eki) v

let test1 = koushin
    {namae="代々木公園"; saitan_kyori=1.0; temae_list=["代々木公園"; "代々木上原"]}
    [
        {namae="明治神宮前"; saitan_kyori=infinity; temae_list=[]};
    ] = [
        {namae="明治神宮前"; saitan_kyori=2.2; temae_list=["明治神宮前";"代々木公園"; "代々木上原"];};
    ]

let test2 = koushin
    {namae="代々木公園"; saitan_kyori=1.0; temae_list=["代々木公園"; "代々木上原"]}
    [
        {namae="明治神宮前"; saitan_kyori=infinity; temae_list=[]};
        {namae="表参道"; saitan_kyori=infinity; temae_list=[]};
    ] = [
        {namae="明治神宮前"; saitan_kyori=2.2; temae_list=["明治神宮前";"代々木公園"; "代々木上原"];};
        {namae="表参道"; saitan_kyori=infinity; temae_list=[];};
    ]
