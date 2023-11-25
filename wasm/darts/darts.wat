(module
  (func (export "score") (param $x f32) (param $y f32) (result i32)
    (local $x2 f32)
    (local $y2 f32)
    (local $boundary f32)

    (f32.mul (local.get $x) (local.get $x))
    (local.set $x2)

    (f32.mul (local.get $y) (local.get $y))
    (local.set $y2)

    (f32.add (local.get $y2) (local.get $x2))
    (local.set $boundary)

    (if (f32.gt (local.get $boundary) (f32.const 100))
      (then (return (i32.const 0)))
    )

    (if (f32.gt (local.get $boundary) (f32.const 25))
      (then (return (i32.const 1)))
    )

    (if (f32.gt (local.get $boundary) (f32.const 1))
      (then (return (i32.const 5)))
    )

    i32.const 10
  )
)
