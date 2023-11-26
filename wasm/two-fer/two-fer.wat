(module
  (memory (export "mem") 1)

  ;;
  ;; Given a string X, return a string that says "One for X, one for me."
  ;; If the X is empty, return the string "One for you, one for me."
  ;;
  ;; @param {i32} $offset - The offset of the name in linear memory.
  ;; @param {i32} $length - The length of the name in linear memory.
  ;;
  ;; @return {(i32,i32)} - The offset and length the resulting string in linear memory.
  ;;
  (data (i32.const 96) "One for ")
  (data (i32.const 108) "you")
  (data (i32.const 112) ", one for me.")

  (func (export "twoFer") (param $offset i32) (param $length i32) (result i32 i32)
    (local $prefix_length i32)
    (local $suffix_length i32)
    (local $default_param_length i32)
    (local $param_length i32)
    (local $total_length i32)
    (local $output_string i32)

    (local.set $prefix_length (i32.const 8))
    (local.set $default_param_length (i32.const 3))
    (local.set $suffix_length (i32.const 13))
    (local.set $total_length (i32.add (local.get $prefix_length) (local.get $suffix_length)))


    (if (i32.gt_u (local.get $length) (i32.const 0))
      (then (local.set $param_length (local.get $length)))
      (else (local.set $param_length (local.get $default_param_length)))
    )

    (local.set $total_length (i32.add (local.get $param_length) (local.get $total_length)))

    ;;(data (i32.const 128) (local.get $total_length))
    ;;(memory.fill (i32.const 1) (i32.const 96) (local.get $total_length))
    (table.set $output_string)
    ;;(return (memory.size))

    ;;(return (local.get $offset) (local.get $length))
    ;;(return (i32.const 64) (i32.const 15))
    ;;(return (i32.add (local.get $offset) (i32.const 64)) (i32.const 4))
    ;;(return (i32.const 8) (i32.const 0))

    ;;(return (local.get $offset) (local.get $length))
    ;;(return (i32.const 96) (i32.const 8))
    ;;(return (i32.const 96) (local.get $prefix_length))
    ;;(return (i32.const 108) (i32.const 3))
    ;;(return (i32.const 108) (local.get $default_param_length))
    ;;(return (i32.const 112) (i32.const 13))
    ;;(return (i32.const 112) (local.get $suffix_length))
    (return (local.get $total_length))
    ;;(return (i32.const 128) (local.get $total_length))
  )
)
