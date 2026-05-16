(module
  (memory (export "mem") 1)
  (func $counting_sort (param $n i32) (param $exp i32)
    (local $i i32)
    (local $idx i32)
    (local $val i32)
    (local $pos i32)
    (local $count_base i32)
    (local $out_base i32)
    (local.set $count_base (i32.const 256))
    (local.set $out_base (i32.const 296))
    (local.set $i (i32.const 0))
    (block $break
      (loop $clear
        (br_if $break (i32.ge_u (local.get $i) (i32.const 10)))
        (i32.store (i32.add (local.get $count_base) (i32.mul (local.get $i) (i32.const 4))) (i32.const 0))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $clear)
      )
    )
    (local.set $i (i32.const 0))
    (block $break2
      (loop $count
        (br_if $break2 (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $val (i32.load (i32.mul (local.get $i) (i32.const 4))))
        (local.set $idx (i32.rem_u (i32.div_u (local.get $val) (local.get $exp)) (i32.const 10)))
        (i32.store
          (i32.add (local.get $count_base) (i32.mul (local.get $idx) (i32.const 4)))
          (i32.add
            (i32.load (i32.add (local.get $count_base) (i32.mul (local.get $idx) (i32.const 4))))
            (i32.const 1)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $count)
      )
    )
  )
  (func $radix_sort (export "radix_sort") (param $n i32))
)
