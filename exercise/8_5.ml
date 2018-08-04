(* 駅名の情報を格納するレコード型を宣言 *)
type ekimei_t = { 
    kanji : string; (* 漢字の駅名 *)
    kana : string; (* ひらがなの駅名 *)
    romaji : string; (* ローマ字の駅名 *)
    shozoku : string; (* 路線名 *)
}

let ekimei1 = { kanji = "亀戸"; kana = "カメイド"; romaji = "kameido"; shozoku = "総武線" }
let ekimei2 = { kanji = "錦糸町"; kana = "キンシチョウ"; romaji = "kinshicho"; shozoku = "総武線" }

