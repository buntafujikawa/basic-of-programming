#use "metoro.ml"

(* 昇順に並んでいるekimei_tのリストとekimei_tを受け取ったら、昇順となる位置にekimei_tを挿入したリストを返す *)
(* insert : ekimei_t list -> ekimei_t -> ekimei_t list *)
let rec insert ekimei_list ekimei = match ekimei_list with
    [] -> [ekimei]
    | ({ kanji=kanji_list; kana=kana_list; romaji=romaji_list; shozoku=shozoku_list; }) as first :: rest ->
    let { kanji=kanji; kana=kana; romaji=romaji; shozoku=shozoku; } = ekimei in
        if kana < kana_list then ekimei :: ekimei_list
        else first :: insert rest ekimei

let test1 = insert [
    {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
    {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
    {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
    ] {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"} = [
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"};
    {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
    {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
    {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
]

let test2 = insert [
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"};
    {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
    {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
    ] {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"} = [
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"};
    {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
    {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
    {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
]

(* ekimei_tのリストを受け取ったら、それを昇順に整列したリストを返す *)
(* ekimei_t list -> ekimei_t list *)
let rec ins_sort ekimei_list = match ekimei_list with
    [] -> []
    | first :: rest -> insert (ins_sort rest) first

let test1 = ins_sort [] = []
let test2 = ins_sort [
    {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
    {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"};
    {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
] = [
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"};
    {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
    {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
    {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
]
