(* お小遣い帳の情報を格納するレコード型を宣言 *)
type okozukai_t = { name : string; price : int; place : string; date : string; }

let test1 = { name = "りんご"; price = 100; place = "八百屋"; date = "2018-08-04" }
let test2 = { name = "みかん"; price = 50; place = "スーパー"; date = "2018-07-01" }
let test3 = { name = "いちご"; price = 150; place = "コンビニ"; date = "2018-04-01" }

