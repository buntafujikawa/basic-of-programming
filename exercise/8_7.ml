(* 駅と駅の接続情報を格納するレコード型の宣言 *)
type ekikan_t = {
    kiten : string; (* 起点の駅名 *)
    shuten : string; (* 終点の駅名 *)
    keiyu : string; (* 経由する駅名 *)
    kyori : float; (* 2駅間の距離 *)
    jikan : int; (* 所要時間 *)
}
