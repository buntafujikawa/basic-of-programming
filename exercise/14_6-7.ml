type gakusei_t = {
    name : string;
    tensuu : int;
    seiseki : string;
}

(* 学生リストlstのうち成績がseiseki0の人の数を返す *)
(* count : gakusei_t list -> string -> int *)
let rec count lst seiseki0 =
    let is_seiseki0 lst =
        let {name=name; tensuu=tensuu; seiseki=seiseki} = lst in
        seiseki = seiseki0 in
    List.length (List.filter is_seiseki0 lst)

let test1 = count [] "A" = 0
let test2 = count [
    {name="hoge";tensuu=1;seiseki="A";};
    {name="hoge";tensuu=1;seiseki="A";};
    {name="hoge";tensuu=1;seiseki="B";};
    {name="hoge";tensuu=1;seiseki="AB";}
] "A" = 2
let test3 = count [
    {name="hoge";tensuu=1;seiseki="A";};
    {name="hoge";tensuu=1;seiseki="A";};
    {name="hoge";tensuu=1;seiseki="B";};
    {name="hoge";tensuu=1;seiseki="AB";}
] "B" = 1
