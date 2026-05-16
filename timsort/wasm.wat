(module
  (memory 1)
  (export "memory" (memory 0))

  (func $insertion_sort (param $left i32) (param $right i32)
    (local $i i32)
    (local $j i32)
    (local $key i32)
    (local.set $i (i32.add (local.get $left) (i32.const 1)))
    (block $break
      (loop $loop
        (br_if $break (i32.gt_s (local.get $i) (local.get $right)))
        (local.set $key
          (i32.load (i32.mul (local.get $i) (i32.const 4))))
        (local.set $j (i32.sub (local.get $i) (i32.const 1)))
        (block $inner_break
          (loop $inner
            (br_if $inner_break
              (i32.or
                (i32.lt_s (local.get $j) (local.get $left))
                (i32.le_s
                  (i32.load (i32.mul (local.get $j) (i32.const 4)))
                  (local.get $key))))
            (i32.store
              (i32.mul (i32.add (local.get $j) (i32.const 1)) (i32.const 4))
              (i32.load (i32.mul (local.get $j) (i32.const 4))))
            (local.set $j (i32.sub (local.get $j) (i32.const 1)))
            (br $inner)))
        (i32.store
          (i32.mul (i32.add (local.get $j) (i32.const 1)) (i32.const 4))
          (local.get $key))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
  )

  (func $timsort (param $n i32)
    (local $i i32)
    (local $right i32)
    (local.set $i (i32.const 0))
    (block $break
      (loop $loop
        (br_if $break (i32.ge_s (local.get $i) (local.get $n)))
        (local.set $right
          (select
            (i32.sub (i32.add (local.get $i) (i32.const 32)) (i32.const 1))
            (i32.sub (local.get $n) (i32.const 1))
            (i32.lt_s
              (i32.sub (i32.add (local.get $i) (i32.const 32)) (i32.const 1))
              (local.get $n))))
        (call $insertion_sort (local.get $i) (local.get $right))
        (local.set $i (i32.add (local.get $i) (i32.const 32)))
        (br $loop)))
  )

  (export "timsort" (func $timsort))
  (export "insertion_sort" (func $insertion_sort))
)
