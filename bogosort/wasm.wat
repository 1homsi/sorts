(module
  (memory (export "mem") 1)

  (func $is_sorted (param $n i32) (result i32)
    (local $i i32)
    (local.set $i (i32.const 0))
    (block $break
      (loop $loop
        (br_if $break (i32.ge_s (local.get $i) (i32.sub (local.get $n) (i32.const 1))))
        (br_if $break
          (i32.gt_s
            (i32.load (i32.mul (local.get $i) (i32.const 4)))
            (i32.load (i32.mul (i32.add (local.get $i) (i32.const 1)) (i32.const 4)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)
      )
    )
    (i32.eq (local.get $i) (i32.sub (local.get $n) (i32.const 1)))
  )

  (func $main (export "main")
    (i32.store (i32.const 0) (i32.const 3))
    (i32.store (i32.const 4) (i32.const 1))
    (i32.store (i32.const 8) (i32.const 4))
    (i32.store (i32.const 12) (i32.const 1))
    (i32.store (i32.const 16) (i32.const 5))
    (i32.store (i32.const 20) (i32.const 9))
    (i32.store (i32.const 24) (i32.const 2))
    (i32.store (i32.const 28) (i32.const 6))
  )
)
