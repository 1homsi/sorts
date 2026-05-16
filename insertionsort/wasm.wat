(module
  (memory 1)
  (func $insertion_sort (param $addr i32) (param $n i32)
    (local $i i32)
    (local $j i32)
    (local $key i32)
    (local.set $i (i32.const 1))
    (block $break
      (loop $outer
        (br_if $break (i32.ge_s (local.get $i) (local.get $n)))
        (local.set $key
          (i32.load (i32.add (local.get $addr) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $j (i32.sub (local.get $i) (i32.const 1)))
        (block $inner_break
          (loop $inner
            (br_if $inner_break (i32.lt_s (local.get $j) (i32.const 0)))
            (br_if $inner_break
              (i32.le_s
                (i32.load (i32.add (local.get $addr) (i32.mul (local.get $j) (i32.const 4))))
                (local.get $key)))
            (i32.store
              (i32.add (local.get $addr) (i32.mul (i32.add (local.get $j) (i32.const 1)) (i32.const 4)))
              (i32.load (i32.add (local.get $addr) (i32.mul (local.get $j) (i32.const 4)))))
            (local.set $j (i32.sub (local.get $j) (i32.const 1)))
            (br $inner)))
        (i32.store
          (i32.add (local.get $addr) (i32.mul (i32.add (local.get $j) (i32.const 1)) (i32.const 4)))
          (local.get $key))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer)))
  )
  (export "insertion_sort" (func $insertion_sort))
)
