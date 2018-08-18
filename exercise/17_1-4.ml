(* 年号を表す型 *)
type nengou_t = Meiji of int
              | Taisho of int
              | Showa of int
              | Heisei of int

(* 年号を受け取ったら対応する西暦年を返す *)
(* to_seireki : nengou_t -> int *)
let to_seireki nengou = match nengou with
    Meiji (n) -> n + 1967
  | Taisho (n) -> n + 1911
  | Showa (n) -> n + 1925
  | Heisei (n) -> n + 1988

(* nengou_tを受け取ったら年齢を返す *)
(* nenrei : nengou_t -> nengou_t -> int *)
let nenrei birth_year this_year =
    to_seireki this_year - to_seireki birth_year

let test1 = nenrei (Heisei (6)) (Heisei (30)) = 24
let test2 = nenrei (Showa (30)) (Heisei (30)) = 63
