#use "metro.ml"

type eki_t = {
    namae : string; (* 駅名 *)
    saitan_kyori : float; (* 最短距離 *)
    temae_list : string list; (* 駅名のリスト *)
}

(* ekimei_t型のリストを受け取ったら、その駅名を使ってeki_t型のリストを作る *)
(* make_eki_list : ekimei_t list -> eki_t list *)
let rec make_eki_list ekimei_list = match ekimei_list with
    [] -> []
    | { kanji=kanji; kana=kana; romaji=romaji; shozoku=shozoku; } :: rest ->
        {namae=kanji; saitan_kyori=infinity; temae_list=[]} :: make_eki_list rest

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
