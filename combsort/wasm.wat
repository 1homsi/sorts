(module
  (memory (export "memory") 1)

  (func (export "combSort") (param $base i32) (param $n i32)
    (local $gap i32)
    (local $sorted i32)
    (local $i i32)
    (local $a i32)
    (local $b i32)
    (local $tmp i32)
    (local.set $gap (local.get $n))
    (local.set $sorted (i32.const 0))
    (block $break
      (loop $outer
        (br_if $break (i32.eq (local.get $sorted) (i32.const 1)))
        (local.set $gap
          (i32.trunc_f64_s
            (f64.div (f64.convert_i32_s (local.get $gap)) (f64.const 1.3))))
        (if (i32.le_s (local.get $gap) (i32.const 1))
          (then
            (local.set $gap (i32.const 1))
            (local.set $sorted (i32.const 1))))
        (local.set $i (i32.const 0))
        (block $inner_break
          (loop $inner
            (br_if $inner_break
              (i32.ge_s
                (i32.add (local.get $i) (local.get $gap))
                (local.get $n)))
            (local.set $a
              (i32.load
                (i32.add (local.get $base)
                  (i32.mul (local.get $i) (i32.const 4)))))
            (local.set $b
              (i32.load
                (i32.add (local.get $base)
                  (i32.mul
                    (i32.add (local.get $i) (local.get $gap))
                    (i32.const 4)))))
            (if (i32.gt_s (local.get $a) (local.get $b))
              (then
                (i32.store
                  (i32.add (local.get $base)
                    (i32.mul (local.get $i) (i32.const 4)))
                  (local.get $b))
                (i32.store
                  (i32.add (local.get $base)
                    (i32.mul
                      (i32.add (local.get $i) (local.get $gap))
                      (i32.const 4)))
                  (local.get $a))
                (local.set $sorted (i32.const 0))))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $inner)))
        (br $outer)))
  )
)
