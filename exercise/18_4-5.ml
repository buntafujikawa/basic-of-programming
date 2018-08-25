#use "17_14-15.ml"

(* get_ekikan_kyoriとkoushinを例外を使用して書き直す *)
(* get_ekikan_kyori : string -> string -> ekikan_tree_t -> float *)
let rec get_ekikan_kyori eki1 eki2 ekikan_tree = match ekikan_tree with
    Empty -> raise Not_found
  | Node (left, ekimei, list , right) ->
        if eki1 < ekimei then get_ekikan_kyori eki1 eki2 left
        else if  eki1 > ekimei then get_ekikan_kyori eki1 eki2 right
        else assoc eki2 list

(* koushin : eki_t -> eki_t list -> ekikan_tree_t -> eki_t list *)
let koushin eki v ekikan_tree =
    List.map (
            (fun eki_p eki_q ->
                let {namae=p_namae; saitan_kyori=p_saitan_kyori; temae_list=p_temae_list} = eki_p in
                let {namae=q_namae; saitan_kyori=q_saitan_kyori; temae_list=q_temae_list} = eki_q in
                (* ここをekikan_treeに変更する *)
                try
                    let kyori = get_ekikan_kyori p_namae q_namae ekikan_tree in
                    if kyori != infinity then
                        if p_saitan_kyori < q_saitan_kyori then
                            {namae=q_namae; saitan_kyori=kyori +. p_saitan_kyori; temae_list=q_namae::p_temae_list}
                        else eki_q
                    else eki_q
                with Not_found -> eki_q)
        eki) v
