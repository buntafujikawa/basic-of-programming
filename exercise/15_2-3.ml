(* ふたつの自然数を受け取ったら、その最大公約数を返す(ユークリッドの互除法) *)
(* gcd : int -> int -> int *)
let rec gcd m n =
    if n = 0 then m
             else gcd n (m mod n)

let test1 = gcd 1 0 = 1
let test2 = gcd 6 2 = 2
let test3 = gcd 1071 1029 = 21

(* 2以上n以下の自然数のリストを受け取ったら、2以上n以下の素数のリストを返す (エラトステネスのふるい) *)
(* sieve : int list -> int list *)
let sieve list = match list with
    [] -> []
    | first :: rest ->
    let get_prime first rest = List.filter (fun n -> n mod first != 0) rest
    in first :: (sieve (get_prime first rest))

let test1 = sieve [2; 3; 4; 5; 6; 7; 8; 9] = [2; 3; 5; 7]

(* 自然数を受け取ったら、それ以下の素数のリストを返す *)
(* prime : int -> int list *)
let prime n =
    let rec enumerate n =
        if n = 1 then [] else enumerate (n -1) @ [n]
    in sieve(enumerate n)

let test1 = prime 9 = [2; 3; 5; 7]
let test2 = prime 2 = [2;]
