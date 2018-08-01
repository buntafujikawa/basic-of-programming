(* 時間を受け取ったら、午前か午後かを返す *)
(* jikan : int -> string *)

let jikan hour =
    if hour = 0 then "午後"
    else if (((hour - 1) / 12) mod 2 = 1) then "午後" else "午前"

let test1 = jikan 0 = "午後"
let test2 = jikan 1 = "午前"
let test3 = jikan 12 = "午前"
let test4 = jikan 13 = "午後"
let test5 = jikan 24 = "午後"
let test6 = jikan 25 = "午前"
