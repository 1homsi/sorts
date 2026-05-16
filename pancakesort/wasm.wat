(module
  (memory 1)
  (data (i32.const 0) "\03\00\00\00\06\00\00\00\02\00\00\00\07\00\00\00\04\00\00\00\01\00\00\00\05\00\00\00")

  (func $flip (param $k i32)
    (local $left i32)
    (local $right i32)
    (local $tmp i32)
    (local.set $left (i32.const 0))
    (local.set $right (local.get $k))
    (block $break
      (loop $loop
        (br_if $break (i32.ge_s (local.get $left) (local.get $right)))
        (local.set $tmp (i32.load (i32.mul (local.get $left) (i32.const 4))))
        (i32.store (i32.mul (local.get $left) (i32.const 4))
                   (i32.load (i32.mul (local.get $right) (i32.const 4))))
        (i32.store (i32.mul (local.get $right) (i32.const 4)) (local.get $tmp))
        (local.set $left (i32.add (local.get $left) (i32.const 1)))
        (local.set $right (i32.sub (local.get $right) (i32.const 1)))
        (br $loop)
      )
    )
  )

  (func $pancake_sort (param $n i32)
    (local $size i32)
    (local $max_idx i32)
    (local $i i32)
    (local.set $size (local.get $n))
    (block $outer_break
      (loop $outer
        (br_if $outer_break (i32.le_s (local.get $size) (i32.const 1)))
        (local.set $max_idx (i32.const 0))
        (local.set $i (i32.const 1))
        (block $inner_break
          (loop $inner
            (br_if $inner_break (i32.ge_s (local.get $i) (local.get $size)))
            (if (i32.gt_s
                  (i32.load (i32.mul (local.get $i) (i32.const 4)))
                  (i32.load (i32.mul (local.get $max_idx) (i32.const 4))))
              (then (local.set $max_idx (local.get $i))))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $inner)
          )
        )
        (if (i32.ne (local.get $max_idx) (i32.sub (local.get $size) (i32.const 1)))
          (then
            (if (i32.ne (local.get $max_idx) (i32.const 0))
              (then (call $flip (local.get $max_idx))))
            (call $flip (i32.sub (local.get $size) (i32.const 1)))))
        (local.set $size (i32.sub (local.get $size) (i32.const 1)))
        (br $outer)
      )
    )
  )

  (func (export "sort")
    (call $pancake_sort (i32.const 7))
  )
)
