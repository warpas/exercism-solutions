(module
  ;;
  ;; Calculate the square of the sum of the first N natural numbers
  ;;
  ;; @param {i32} max - The upper bound (inclusive) of natural numbers to consider
  ;;
  ;; @returns {i32} The square of the sum of the first N natural numbers
  ;;
  (func $squareOfSum (export "squareOfSum") (param $max i32) (result i32)
    (local $current i32)
    (local $accumulator i32)

    (local.set $current (local.get $max))
    (local.set $accumulator (i32.const 0))

    ;;(i32.const 1)
    ;;(local.get $max)
    (block $my_block
      (loop $my_loop
        (local.set $accumulator (i32.add (local.get $accumulator) (local.get $current)))
        (local.set $current (i32.sub (local.get $current) (i32.const 1)))
        ;;br_if $my_loop (i32.eqz (local.get $current) (i32.const 0))
        ;;br_if $my_loop (i32.eqz (local.get $current))
        ;;br $my_loop
        (br_if $my_loop (i32.ne (local.get $current) (i32.const 0)))
        ;;(return (i32.const 51))
      )
    )

    (i32.mul (local.get $accumulator) (local.get $accumulator))
  )

  ;;
  ;; Calculate the sum of the squares of the first N natural numbers
  ;;
  ;; @param {i32} max - The upper bound (inclusive) of natural numbers to consider
  ;;
  ;; @returns {i32} The sum of the squares of the first N natural numbers
  ;;
  (func $sumOfSquares (export "sumOfSquares") (param $max i32) (result i32)
    (i32.const 42)
  )

  ;;
  ;; Calculate the difference between the square of the sum and the sum of the
  ;; squares of the first N natural numbers.
  ;;
  ;; @param {i32} max - The upper bound (inclusive) of natural numbers to consider
  ;;
  ;; @returns {i32} Difference between the square of the sum and the sum of the
  ;;                squares of the first N natural numbers.
  ;;
  (func (export "difference") (param $max i32) (result i32)
    (call $squareOfSum (i32.const 42))
  )
)
