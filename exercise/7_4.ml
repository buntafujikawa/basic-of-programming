(* x座標とy座標の組で表された平面座標を2つ受け取ったら、その中点の座標を返す *)
(* chuten : float * float -> float * float -> float * float *)
let chuten pair1 pair2 = match pair1 with
    (x1, y1) -> match pair2 with
    (x2, y2) -> ((x1 +. x2) /. 2., (y1 +. y2) /. 2.)

let test1 = chuten (1., 1.) (3., 3.) = (2., 2.)
let test2 = chuten (0., 0.) (0., 0.) = (0., 0.)
