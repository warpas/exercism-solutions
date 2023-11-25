(module
  (func (export "score") (param $x f32) (param $y f32) (result i32)
    (local $x2 i32)
    (local $y2 i32)
    (local $boundary i32)

    ;; calculate x2 = x * x
    (local.get $x)
    (local.get $x)
    f32.mul
    i32.trunc_f32_s
    (local.set $x2)

    ;; calculate y2 = y * y
    (local.get $y)
    (local.get $y)
    f32.mul
    i32.trunc_f32_s
    (local.set $y2)

    ;; calculate boundary = x2 + y2
    (local.get $x2)
    (local.get $y2)
    i32.add
    (local.set $boundary)


    ;; def score
      ;; return 0 if @boundary > 100
      ;; return 1 if @boundary > 25
      ;; return 5 if @boundary > 1

      ;; 10
    ;; end

    (local.get $boundary)
    (i32.const 100)
    i32.gt_u
    (if
      (then
        i32.const 0
        return
      )
    )

    (local.get $boundary)
    (i32.const 25)
    i32.gt_u
    (if
      (then
        i32.const 1
        return
      )
    )

    (local.get $boundary)
    (i32.const 1)
    i32.gt_u
    (if
      (then
        i32.const 5
        return
      )
    )

    ;; default return: missed the target completely
    ;;(return (i32.const -10))
    (return (i32.const 10))
  )
)
