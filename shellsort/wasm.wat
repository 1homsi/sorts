(module
  (memory 1)
  (func $shell_sort (param $n i32)
    (local $gap i32)
    (local $i i32)
    (local $j i32)
    (local $temp i32)
    (local.set $gap (i32.div_s (local.get $n) (i32.const 2)))
    (block $break
      (loop $gap_loop
        (br_if $break (i32.le_s (local.get $gap) (i32.const 0)))
        (local.set $i (local.get $gap))
        (block $ibreak
          (loop $i_loop
            (br_if $ibreak (i32.ge_s (local.get $i) (local.get $n)))
            (local.set $temp (i32.load (i32.mul (local.get $i) (i32.const 4))))
            (local.set $j (local.get $i))
            (block $jbreak
              (loop $j_loop
                (br_if $jbreak (i32.lt_s (local.get $j) (local.get $gap)))
                (br_if $jbreak
                  (i32.le_s
                    (i32.load (i32.mul (i32.sub (local.get $j) (local.get $gap)) (i32.const 4)))
                    (local.get $temp)))
                (i32.store
                  (i32.mul (local.get $j) (i32.const 4))
                  (i32.load (i32.mul (i32.sub (local.get $j) (local.get $gap)) (i32.const 4))))
                (local.set $j (i32.sub (local.get $j) (local.get $gap)))
                (br $j_loop)))
            (i32.store (i32.mul (local.get $j) (i32.const 4)) (local.get $temp))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $i_loop)))
        (local.set $gap (i32.div_s (local.get $gap) (i32.const 2)))
        (br $gap_loop)))
  )
  (export "shell_sort" (func $shell_sort))
)
