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

(* 1月から12がつを表す *)
type year_t = January of int
            | February of int
            | March of int
            | April of int
            | May of int
            | June of int
            | July of int
            | August of int
            | September of int
            | October of int
            | November of int
            | December of int

(* 12星座を表す *)
type seiza_t = Capricorn
               | Aquarius
               | Pisces
               | Aries
               | Taurus
               | Gemini
               | Cancer
               | Leo
               | Virgo
               | Libra
               | Scorpio
               | Sagittarius

(* year_t型を受け取ってきたら、seiza_tがたの星座を返す *)
(* seiza : year_t -> seiza_t *)
let seiza year = match year with
    January (n) -> if n <= 19 then Capricorn else Aquarius
  | February (n) -> if n <= 18 then Aquarius else Pisces
  | March (n) -> if n <= 20 then Pisces else Aries
  | April (n) -> if n <= 19 then Aries else Taurus
  | May (n) -> if n <= 20 then Taurus else Gemini
  | June (n) -> if n <= 21 then Gemini else Cancer
  | July (n) -> if n <= 22 then Cancer else Leo
  | August (n) -> if n <= 22 then Leo else Virgo
  | September (n) -> if n <= 22 then Virgo else Libra
  | October (n) -> if n <= 23 then Libra else Scorpio
  | November (n) -> if n <= 22 then Scorpio else Sagittarius
  | December (n) -> if n <= 23 then Sagittarius else Capricorn

let test1 = seiza (January (1)) = Capricorn
let test1 = seiza (March (25)) = Aries
