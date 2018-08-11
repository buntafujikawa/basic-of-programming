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
