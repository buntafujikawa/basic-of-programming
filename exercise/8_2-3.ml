(* お小遣い帳の情報を格納するレコード型を宣言 *)
type okozukai_t = { name : string; price : int; place : string; date : string; }

let test1 = { name = "りんご"; price = 100; place = "八百屋"; date = "2018-08-04" }
let test2 = { name = "みかん"; price = 50; place = "スーパー"; date = "2018-07-01" }
let test3 = { name = "いちご"; price = 150; place = "コンビニ"; date = "2018-04-01" }

(* 各人の名前、身長、体重、誕生日と血液型の情報を格納するレコード型を宣言 *)
type person_t = { name : string;  height : float; weight : float; month : int; day : int; blood_type : string; }

let test1 = { name = "鈴木";  height = 170.0; weight = 64.5; month = 1; day = 2; blood_type = "A" }
let test2 = { name = "田中";  height = 180.0; weight = 74.9; month = 2; day = 3; blood_type = "B" }
let test3 = { name = "佐藤";  height = 190.0; weight = 100.0; month = 3; day = 4; blood_type = "AB" }

