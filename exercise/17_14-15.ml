#use "17_10-13.ml"
#use "17_14-15.ml"

(* 駅名二つとekikan_tree_t型の木を受け取ってきたら、その2駅間の距離を返す *)
(* get_ekikan_kyori : string -> string -> ekikan_tree_t -> float *)
let rec get_ekikan_kyori eki1 eki2 ekikan_tree = match ekikan_tree with
    Empty -> infinity
    | Node (left, ekimei, list , right) ->
        if eki1 < ekimei then get_ekikan_kyori eki1 eki2 left
        else if  eki1 > ekimei then get_ekikan_kyori eki1 eki2 right
        else assoc eki2 list

let ekikan_tree = inserts_ekikan Empty global_ekikan_list
let test1 = get_ekikan_kyori "茗荷谷" "新大塚" ekikan_tree = 1.2
let test2 = get_ekikan_kyori "表参道" "代々木公園" ekikan_tree = infinity
