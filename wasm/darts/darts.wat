(module
  (func (export "score") (param $x f32) (param $y f32) (result i32)
    (local $x2 f32)
    (local $y2 f32)
    (local $boundary f32)

    ;; calculate x2 = x * x
    (local.get $x)
    (local.get $x)
    f32.mul
    (local.set $x2)

    ;; calculate y2 = y * y
    (local.get $y)
    (local.get $y)
    f32.mul
    (local.set $y2)

    ;; calculate boundary = x2 + y2
    (local.get $x2)
    (local.get $y2)
    f32.add
    (local.set $boundary)

    (local.get $boundary)
    (f32.const 100)
    f32.gt
    (if
      (then
        i32.const 0
        return
      )
    )

    (local.get $boundary)
    (f32.const 25)
    f32.gt
    (if
      (then
        i32.const 1
        return
      )
    )

    (local.get $boundary)
    (f32.const 1)
    f32.gt
    (if
      (then
        i32.const 5
        return
      )
    )

    i32.const 10
  )
)
