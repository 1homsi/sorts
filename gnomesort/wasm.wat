(module
  (memory 1)
  (func $gnome_sort (param $n i32)
    (local $i i32)
    (local $tmp i32)
    (local.set $i (i32.const 0))
    (block $break
      (loop $loop
        (br_if $break (i32.ge_s (local.get $i) (local.get $n)))
        (if (i32.or
              (i32.eq (local.get $i) (i32.const 0))
              (i32.ge_s
                (i32.load (i32.mul (local.get $i) (i32.const 4)))
                (i32.load (i32.mul (i32.sub (local.get $i) (i32.const 1)) (i32.const 4)))))
          (then (local.set $i (i32.add (local.get $i) (i32.const 1))))
          (else
            (local.set $tmp (i32.load (i32.mul (local.get $i) (i32.const 4))))
            (i32.store (i32.mul (local.get $i) (i32.const 4))
              (i32.load (i32.mul (i32.sub (local.get $i) (i32.const 1)) (i32.const 4))))
            (i32.store (i32.mul (i32.sub (local.get $i) (i32.const 1)) (i32.const 4)) (local.get $tmp))
            (local.set $i (i32.sub (local.get $i) (i32.const 1)))))
        (br $loop)))
  )
  (export "gnome_sort" (func $gnome_sort))
)
