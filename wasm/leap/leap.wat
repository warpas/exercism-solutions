(module
  ;; Returns 1 if leap year, 0 otherwise
  ;; TODO: Remove my failed attempts at importing console.log
  ;; (import "console" "log" (func $log (param i32)))
  ;;(func $log (import "imports" "log") (param i32))
  ;;(func $log (import "console" "log") (param i32))
  ;;(import "console" "log" (func $log (param i32)))

  (func (export "isLeap") (param $year i32) (result i32)
    (local $variable i32)
    (local.set $variable (i32.const 12))

    ;; is the year NOT divisible by 400?
    (i32.rem_s (local.get $year) (i32.const 400))
    (if
      (then
        ;; (i32.rem_s (local.get $year) (i32.const 4))

        ;; is the year NOT divisible by 100?
        (i32.rem_s (local.get $year) (i32.const 100))
        (if
          (then
            ;; (i32.rem_s (local.get $year) (i32.const 4))
            ;;i32.const 1
            ;;return

            ;; is the year NOT divisible by 4?
            (i32.rem_s (local.get $year) (i32.const 4))
            ;; local.get $variable
            ;;i32.const 0
            (if
              (then
                ;; (i32.rem_s (local.get $year) (i32.const 4))
                i32.const 0
                return
                ;; do something
              )
              (else
                i32.const 1
                return
                ;; do something else
              )
            )
            ;; do something
          )
          (else
            i32.const 0
            return
            ;; do something else
          )
        )
        ;;return
        ;; do something
      )
      (else
        i32.const 1
        return
        ;; do something else
      )
    )

    ;; IF STATEMENT (the first line is the condition)

    ;; TODO: remove the fallback implicit return below
    i32.const 0
  )

  ;; TODO: remove the additional definition of relying on console.log
  ;;(func $console_log (param $value i32)
  ;;  (call $log (local.get $value))
  ;;)
)
