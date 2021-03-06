#use "metro.ml"

type ekikan_tree_t =
    Empty
  | Node of ekikan_tree_t * string * (string * float) list * ekikan_tree_t

(* 駅までの距離を返す *)
(* assoc : 'a -> ('a * 'b) list -> 'b  *)
let rec assoc ekimei ekikan_tree = match ekikan_tree with
    [] -> raise Not_found
    | (list_ekimei, list_kyori) :: rest ->
      if list_ekimei = ekimei then list_kyori
                              else assoc ekimei rest

let test1 = assoc "後楽園" [("新大塚", 1.2); ("後楽園", 1.8)] = 1.8
(*let test2 = assoc "池袋" [("新大塚", 1.2); ("後楽園", 1.8)] = Not_found*)
