(module
  (memory 1)
  (data (i32.const 0) "\40\00\00\00\22\00\00\00\19\00\00\00\0c\00\00\00\16\00\00\00\0b\00\00\00\5a\00\00\00")

  (func $bubble_sort (param $n i32)
    (local $i i32)
    (local $j i32)
    (local $tmp i32)
    (local $swapped i32)
    (local.set $n (local.get $n))
    (block $break
      (loop $outer
        (local.set $swapped (i32.const 0))
        (local.set $i (i32.const 0))
        (block $inner_break
          (loop $inner
            (br_if $inner_break (i32.ge_u (local.get $i) (i32.sub (local.get $n) (i32.const 1))))
            (local.set $j (i32.mul (local.get $i) (i32.const 4)))
            (if (i32.gt_s
                  (i32.load (local.get $j))
                  (i32.load (i32.add (local.get $j) (i32.const 4))))
              (then
                (local.set $tmp (i32.load (local.get $j)))
                (i32.store (local.get $j) (i32.load (i32.add (local.get $j) (i32.const 4))))
                (i32.store (i32.add (local.get $j) (i32.const 4)) (local.get $tmp))
                (local.set $swapped (i32.const 1))))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $inner)))
        (local.set $n (i32.sub (local.get $n) (i32.const 1)))
        (br_if $break (i32.eqz (local.get $swapped)))
        (br $outer)))
  )

  (func $main (export "main")
    (call $bubble_sort (i32.const 7))
  )
)
