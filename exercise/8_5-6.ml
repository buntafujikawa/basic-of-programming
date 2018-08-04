(* 駅名の情報を格納するレコード型を宣言 *)
type ekimei_t = { 
    kanji : string; (* 漢字の駅名 *)
    kana : string; (* ひらがなの駅名 *)
    romaji : string; (* ローマ字の駅名 *)
    shozoku : string; (* 路線名 *)
}

let ekimei1 = { kanji = "亀戸"; kana = "かめいど"; romaji = "kameido"; shozoku = "総武線" }
let ekimei2 = { kanji = "錦糸町"; kana = "きんしちょう"; romaji = "kinshicho"; shozoku = "総武線" }

(* ekimei_t型のデータを受け取ってきたら、「路線名, 駅名 (かな)」の形式の文字列を返す *)
(* ekimei_t -> string *)
let hyoji ekimei = match ekimei with
    { kanji : string; kana : string; romaji : string; shozoku : string; }
    -> shozoku ^ "," ^ kanji ^ "(" ^ kana ^ ")"

let test1 = hyoji ekimei1 = "総武線,亀戸(かめいど)"
let test2 = hyoji ekimei2 = "総武線,錦糸町(きんしちょう)"

