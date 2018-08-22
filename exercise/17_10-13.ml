#use "metro.ml"

type ekikan_tree_t =
    Empty
  | Node of ekikan_tree_t * string * (string * float) list * ekikan_tree_t

(* 駅までの距離を返す *)
(* assoc : string -> ekikan_tree_t list -> float *)
let rec assoc ekimei ekikan_tree = match ekikan_tree with
    [] -> infinity
    | (list_ekimei, list_kyori) :: rest ->
      if list_ekimei = ekimei then list_kyori
                              else assoc ekimei rest

let test1 = assoc "後楽園" [("新大塚", 1.2); ("後楽園", 1.8)] = 1.8
let test2 = assoc "池袋" [("新大塚", 1.2); ("後楽園", 1.8)] = infinity

(* 木と駅間を受け取ったら、情報を挿入した木を返す *)
(* insert_ekikan : ekikan_tree_t list -> ekikan_t -> ekikan_tree_t list *)

(* kitenのみをリストにinsertする *)
let rec insert_shuten_ekikan ekikan_tree kiten shuten kyori = match ekikan_tree with
    Empty ->  Node (Empty, kiten, [(shuten, kyori)], Empty)
    | Node (left, ekimei, list , right) ->
        if kiten < ekimei then Node (insert_shuten_ekikan left kiten shuten kyori, ekimei, list, right)
        else if kiten > ekimei then Node (left, ekimei, list, insert_shuten_ekikan right kiten shuten kyori)
        else Node (left, ekimei, (shuten, kyori) :: list, right)

let insert_ekikan ekikan_tree ekikan = match ekikan with
    {kiten=kiten; shuten=shuten; keiyu=keiyu; kyori=kyori; jikan=jikan} ->
      insert_shuten_ekikan (insert_shuten_ekikan ekikan_tree shuten kiten kyori) kiten shuten kyori

let ekikan1 = {kiten="池袋"; shuten="新大塚"; keiyu="丸ノ内線"; kyori=1.8; jikan=3}
let ekikan2 = {kiten="新大塚"; shuten="茗荷谷"; keiyu="丸ノ内線"; kyori=1.2; jikan=2}
let ekikan3 = {kiten="茗荷谷"; shuten="後楽園"; keiyu="丸ノ内線"; kyori=1.8; jikan=2}

let tree1 = insert_ekikan Empty ekikan1
let test1 = tree1 =
    Node (Empty, "新大塚", [("池袋", 1.8)],
    Node (Empty, "池袋", [("新大塚", 1.8)], Empty))
let tree2 = insert_ekikan tree1 ekikan2
let test2 = tree2 =
    Node (Empty, "新大塚", [("茗荷谷", 1.2); ("池袋", 1.8)],
    Node (Empty, "池袋", [("新大塚", 1.8)],
    Node (Empty, "茗荷谷", [("新大塚", 1.2)], Empty)))
