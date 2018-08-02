(* 名前と成績の組を受け取ったら「〇〇さんの評価は△です」という文字列を返す *)
(* seiseki : string * string -> string *)
let seiseki pair = match pair with (name, seiseki) -> name ^ "さんの評価は" ^ seiseki ^  "です"

let test1 = seiseki("hoge", "good") = "hogeさんの評価はgoodです"
let test2 = seiseki("fuga", "bad") = "fugaさんの評価はbadです"

