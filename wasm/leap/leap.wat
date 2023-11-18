(module
  ;; Returns 1 if leap year, 0 otherwise

  (func (export "isLeap") (param $year i32) (result i32)
    (local $variable i32)
    (local.set $variable (i32.const 12))

    ;; is the year NOT divisible by 400?
    (i32.rem_s (local.get $year) (i32.const 400))
    (if
      (then
        ;; is the year NOT divisible by 100?
        (i32.rem_s (local.get $year) (i32.const 100))
        (if
          (then
            ;; is the year NOT divisible by 4?
            (i32.rem_s (local.get $year) (i32.const 4))
            (if
              (then
                i32.const 0
                return
              )
              (else
                i32.const 1
                return
              )
            )
          )
          (else
            i32.const 0
            return
          )
        )
      )
      (else
        i32.const 1
        return
      )
    )

    ;; TODO: remove the fallback implicit return below
    i32.const 0
  )
)
