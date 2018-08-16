#use "metro.ml"

(* make_eki_listをmapと名前のない関数を使って書く *)
(* make_eki_list : ekimei_t list -> eki_t list *)
let make_eki_list ekimei_list =
    List.map (fun ekimei -> match ekimei with
                | { kanji=kanji; kana=kana; romaji=romaji; shozoku=shozoku; }
                -> {namae=kanji; saitan_kyori=infinity; temae_list=[]}
                ) ekimei_list

let test1 = make_eki_list [
        {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
        {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
        {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
        ] =
        [
            {namae="代々木上原"; saitan_kyori=infinity; temae_list=[]};
            {namae="代々木公園"; saitan_kyori=infinity; temae_list=[]};
            {namae="明治神宮前"; saitan_kyori=infinity; temae_list=[]};
        ]

(* shokikaをmapと名前のない関数を使って書く *)
(* shokika : eki_t list -> string -> ekit_t list *)
let shokika eki_list kiten =
    List.map (fun eki -> match eki with
                | ({namae=namae; saitan_kyori=saitan_kyori; temae_list=temae_list}) as first
                -> if namae = kiten then {namae=namae; saitan_kyori=0.; temae_list=[namae]}
                                    else first
    ) eki_list

let test1 = shokika [
    {namae="代々木上原"; saitan_kyori=infinity; temae_list=[]};
    {namae="代々木公園"; saitan_kyori=infinity; temae_list=[]};
    {namae="明治神宮前"; saitan_kyori=infinity; temae_list=[]};
] "代々木上原" = [
    {namae="代々木上原"; saitan_kyori=0.; temae_list=["代々木上原"]};
    {namae="代々木公園"; saitan_kyori=infinity; temae_list=[]};
    {namae="明治神宮前"; saitan_kyori=infinity; temae_list=[]};
]

(* make_eki_listとshokikaを一度にやってしまう *)
(* make_initial_eki_list : ekimei_t list -> strign -> eki_t list *)
let make_initial_eki_list ekimei_list kiten =
    List.map (fun ekimei -> match ekimei with
                | { kanji=kanji; kana=kana; romaji=romaji; shozoku=shozoku; }
                -> if kanji = kiten then {namae=kanji; saitan_kyori=0.; temae_list=[kanji]}
                                    else {namae=kanji; saitan_kyori=infinity; temae_list=[]}
                ) ekimei_list

let test1 = make_initial_eki_list [
        {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
        {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
        {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
        ] "代々木上原" =
        [
            {namae="代々木上原"; saitan_kyori=0.; temae_list=["代々木上原"]};
            {namae="代々木公園"; saitan_kyori=infinity; temae_list=[]};
            {namae="明治神宮前"; saitan_kyori=infinity; temae_list=[]};
        ]
