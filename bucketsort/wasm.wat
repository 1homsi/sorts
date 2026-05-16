(module
  (memory 1)

  (func $insertion_sort (param $base i32) (param $n i32)
    (local $i i32)
    (local $j i32)
    (local $key f64)
    (local.set $i (i32.const 1))
    (block $break
      (loop $loop
        (br_if $break (i32.ge_s (local.get $i) (local.get $n)))
        (local.set $key
          (f64.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 8)))))
        (local.set $j (i32.sub (local.get $i) (i32.const 1)))
        (block $inner_break
          (loop $inner
            (br_if $inner_break (i32.lt_s (local.get $j) (i32.const 0)))
            (br_if $inner_break
              (f64.le
                (f64.load (i32.add (local.get $base) (i32.mul (local.get $j) (i32.const 8))))
                (local.get $key)))
            (f64.store
              (i32.add (local.get $base) (i32.mul (i32.add (local.get $j) (i32.const 1)) (i32.const 8)))
              (f64.load (i32.add (local.get $base) (i32.mul (local.get $j) (i32.const 8)))))
            (local.set $j (i32.sub (local.get $j) (i32.const 1)))
            (br $inner)))
        (f64.store
          (i32.add (local.get $base) (i32.mul (i32.add (local.get $j) (i32.const 1)) (i32.const 8)))
          (local.get $key))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
  )

  (func $main (result i32)
    (i32.const 0))

  (export "main" (func $main))
  (export "insertion_sort" (func $insertion_sort))
)
