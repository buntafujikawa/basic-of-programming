(* 木を表す型 *)
type tree_t = Empty
            | Leaf of int
            | Node of tree_t * int * tree_t

(* treeに含まれる整数を全て加える *)
(* sum_tree : tree_t -> int *)
let rec sum_tree tree = match tree with
    Empty -> 0
  | Leaf (n) -> n
  | Node (t1, n, t2) -> sum_tree t1 + n + sum_tree t2

let tree1 = Empty
let tree2 = Leaf (3)
let tree3 = Node (tree1, 4, tree2)
let tree4 = Node (tree2, 5, tree3)

let test1 = sum_tree tree1 = 0
let test2 = sum_tree tree2 = 3
let test3 = sum_tree tree3 = 7

(* treeの値を全て2倍にした木を返す *)
(* tree_double : tree_t -> tree_t *)
let rec tree_double tree = match tree with
    Empty -> Empty
  | Leaf (n) -> Leaf (n * 2)
  | Node (t1, n, t2) -> Node (tree_double t1, n * 2, tree_double t2)

let test1 = tree_double tree1 = Empty
let test2 = tree_double tree2 = Leaf (6)
let test3 = tree_double tree3 = Node (Empty, 8, (Leaf (6)))
let test4 = tree_double tree4 = Node (Leaf (6), 10, Node (Empty, 8, Leaf (6)))

(* 節や葉に入っている値全てにfを適用した木を返す *)
(* tree_map : (int -> int) -> tree_t -> tree_t *)
let rec tree_map f tree = match tree with
    Empty -> Empty
  | Leaf (n) -> Leaf (f n)
  | Node (t1, n, t2) -> Node (tree_map f t1, f n, tree_map f t2)

let f n = n * 2
let test1 = tree_map f tree1 = Empty
let test2 = tree_map f tree2 = Leaf (6)
let test3 = tree_map f tree3 = Node (Empty, 8, (Leaf (6)))
let test4 = tree_map f tree4 = Node (Leaf (6), 10, Node (Empty, 8, Leaf (6)))

(* tree_t型の木を受け取ったら、節と葉が合計いくつあるかを返す *)
(* tree_length : tree_t -> int *)
let rec tree_length tree = match tree with
     Empty -> 0
   | Leaf (n) -> 1
   | Node (t1, n, t2) -> tree_length t1 + 1 + tree_length t2

let test1 = tree_length tree1 = 0
let test2 = tree_length tree2 = 1
let test3 = tree_length tree3 = 2
let test4 = tree_length tree4 = 4
