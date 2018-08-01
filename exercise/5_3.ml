(* 誕生日を受け取ったら星座を返す *)
(* seiza : int -> int -> string *)

let seiza month day =
    if (month * 100 + day) >= 101 && ( month * 100 + day) <= 119 then "やぎ座"
    else if (month * 100 + day) >= 120 && (month * 100 + day) <= 218 then "みずがめ座"
    else if (month * 100 + day) >= 219 && (month * 100 + day) <= 320 then "うお座"
    else if (month * 100 + day) >= 321 && (month * 100 + day) <= 419 then "おひつじ座"
    else if (month * 100 + day) >= 420 && (month * 100 + day) <= 520 then "おうし座"
    else if (month * 100 + day) >= 521 && (month * 100 + day) <= 621 then "ふたご座"
    else if (month * 100 + day) >= 622 && (month * 100 + day) <= 722 then "かに座"
    else if (month * 100 + day) >= 723 && (month * 100 + day) <= 822 then "しし座"
    else if (month * 100 + day) >= 823 && (month * 100 + day) <= 922 then "おとめ座"
    else if (month * 100 + day) >= 923 && (month * 100 + day) <= 1023 then "てんびん座"
    else if (month * 100 + day) >= 1024 && (month * 100 + day) <= 1122 then "さそり座"
    else if (month * 100 + day) >= 1123 && (month * 100 + day) <= 1221 then "いて座"
    else if (month * 100 + day) >= 1222 && (month * 100 + day) <= 1231 then "やぎ座"
    else ""

let test1 = seiza 1 1 = "やぎ座"
let test2 = seiza 2 1 = "みずがめ座"
let test3 = seiza 3 25 = "おひつじ座"
