(module
  ;;
  ;; Return the number of steps needed to reach 1 in the Collatz conjecture.
  ;;
  ;; @param {i32} number - The number to start from.
  ;;
  ;; @returns {i32} - The number of steps needed to reach 1.
  ;;
  (func (export "steps") (param $number i32) (result i32)
    (local $current i32)
    (local $total_steps i32)

    (if (i32.lt_s (local.get $number) (i32.const 1))
      (then (return (i32.const -1)))
    )

    (local.set $current (local.get $number))
    (local.set $total_steps (i32.const 0))


    (block $calculate_collatz
      (loop $next_step
        (if (i32.eq (local.get $current) (i32.const 1))
          (then (return (local.get $total_steps)))
        )
        (if (i32.eqz (i32.rem_u (local.get $current) (i32.const 2)))
          (then (local.set $current (i32.div_u (local.get $current) (i32.const 2))))
          (else
            (local.set $current (i32.mul (local.get $current) (i32.const 3)))
            (local.set $current (i32.add (local.get $current) (i32.const 1)))
          )
        )

        (local.set $total_steps (i32.add (local.get $total_steps) (i32.const 1)))
        (br_if $next_step (i32.ne (local.get $current) (i32.const 1)))
      )
    )

    (local.get $total_steps)
  )
)
