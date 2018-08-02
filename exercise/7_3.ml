(* x座標とy座標の組で表された平面座標を受け取ったら、x軸について対象な店の座標を返す *)
(* taisho_x : float * float -> float * float *)
let taisho_x pair = match pair with
        (x, y) -> (-.x, y)

let test1 = taisho_x (1., 1.) = (-1., 1.)
let test2 = taisho_x (0., 0.) = (0., 0.)
