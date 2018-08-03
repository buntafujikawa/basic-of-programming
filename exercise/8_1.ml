(* 本意関する情報を格納するレコード型を宣言 *)
type okozukai_t = { title : string; author : string; publisher : string; price : int; isbn : string }

let test1 = { title = "リーダブルコード"; author = "Dustin Boswell"; publisher = "OREILY"; price = 1000; isbn = "978" }
let test2 = { title = "ノンデザイナーズデザインブック"; author = "Robin Williams"; publisher = "マイナビ"; price = 1000; isbn = "978" }
let test3 = { title = "プログラミングの基礎"; author = "浅井健一"; publisher = "サイエンス社"; price = 2300; isbn = "978" }

