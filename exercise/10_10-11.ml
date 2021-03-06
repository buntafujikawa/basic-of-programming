#use "metro.ml"

(* ローマ字の駅名と駅名リストを受け取ったら、その駅の漢字表記を文字列で返す *)
(* romaji_to_kanji : string list -> string *)
let rec romaji_to_kanji target_romaji list = match list with
    [] -> ""
    | {kanji=kanji; kana=kana; romaji=romaji; shozoku=shozoku} :: rest ->
      if target_romaji = romaji then kanji
      else romaji_to_kanji target_romaji rest

let test1 = romaji_to_kanji "hoge" global_ekimei_list = ""
let test2 = romaji_to_kanji "myogadani" global_ekimei_list = "茗荷谷"
let test3 = romaji_to_kanji "akasaka" global_ekimei_list = "赤坂"


(* 駅名を二つ受け取ってその間の距離を返す *)
(* get_ekikan_kyori : string -> string -> 'a list -> float *)
let rec get_ekikan_kyori eki1 eki2 list = match list with
    [] -> infinity
    | {kiten=kiten; shuten=shuten; keiyu=keiyu; kyori=kyori; jikan=jikan} :: rest ->
    if kiten = eki1 then
        if shuten = eki2 then kyori
        else get_ekikan_kyori eki1 eki2 rest
    else if kiten = eki2 then
        if shuten = eki1 then kyori
        else get_ekikan_kyori eki1 eki2 rest
    else get_ekikan_kyori eki1 eki2 rest

let test1 = get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_list = 1.2
let test2 = get_ekikan_kyori "表参道" "代々木公園" global_ekikan_list = infinity


(* ローマ字の駅名を二つ受け取ってきたら、その間の距離を調べる *)
(* kyori_wo_hyoji : string -> string -> string *)
let rec kyori_wo_hyoji eki1 eki2 =
    let eki1_kanji = romaji_to_kanji eki1 global_ekimei_list in
        if eki1_kanji = "" then eki1 ^ "と言う駅は存在しません"
        else let eki2_kanji = romaji_to_kanji eki2 global_ekimei_list in
            if eki2_kanji = "" then eki2 ^ "と言う駅は存在しません"
            else let kyori = get_ekikan_kyori eki1_kanji eki2_kanji global_ekikan_list in
                if kyori = infinity then eki1_kanji ^ "駅と" ^ eki2_kanji ^ "駅はつながっていません"
                else eki1_kanji ^ "駅から" ^ eki2_kanji ^ "駅までは" ^ (string_of_float kyori) ^ "kmです"

let test1 = kyori_wo_hyoji "myogadani" "shinotsuka" = "茗荷谷駅から新大塚駅までは1.2kmです"
let test2 = kyori_wo_hyoji "omotesandou" "yoyogikouen" = "表参道駅と代々木公園駅はつながっていません"
let test3 = kyori_wo_hyoji "hoge" "fuga" = "hogeと言う駅は存在しません"
