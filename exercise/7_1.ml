(* 5教科の点数を与えられたら、その合計点と平均点を組みにして返す *)
(* int -> int -> int -> int -> int -> int * int *)
let goukei_to_heikin kokugo suugaku eigo rika syakai = kokugo + suugaku + eigo + rika + syakai, (kokugo + suugaku + eigo + rika + syakai) / 5

let test1 = goukei_to_heikin 5 10 15 20 25 = (75, 15)
let test2 = goukei_to_heikin 0 0 0 0 0 = (0, 0)
let test3 = goukei_to_heikin 1 2 3 4 6 = (16, 3)

