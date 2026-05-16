(module
  (memory 1)
  (data (i32.const 0) "\0c\00\00\00\0b\00\00\00\0d\00\00\00\05\00\00\00\06\00\00\00\07\00\00\00")

  (func $heapify (param $n i32) (param $i i32)
    (local $largest i32)
    (local $left i32)
    (local $right i32)
    (local $tmp i32)
    (local.set $largest (local.get $i))
    (local.set $left (i32.add (i32.mul (i32.const 2) (local.get $i)) (i32.const 1)))
    (local.set $right (i32.add (i32.mul (i32.const 2) (local.get $i)) (i32.const 2)))
    (if (i32.and
          (i32.lt_s (local.get $left) (local.get $n))
          (i32.gt_s
            (i32.load (i32.mul (local.get $left) (i32.const 4)))
            (i32.load (i32.mul (local.get $largest) (i32.const 4)))))
      (then (local.set $largest (local.get $left))))
    (if (i32.and
          (i32.lt_s (local.get $right) (local.get $n))
          (i32.gt_s
            (i32.load (i32.mul (local.get $right) (i32.const 4)))
            (i32.load (i32.mul (local.get $largest) (i32.const 4)))))
      (then (local.set $largest (local.get $right))))
    (if (i32.ne (local.get $largest) (local.get $i))
      (then
        (local.set $tmp (i32.load (i32.mul (local.get $i) (i32.const 4))))
        (i32.store (i32.mul (local.get $i) (i32.const 4))
                   (i32.load (i32.mul (local.get $largest) (i32.const 4))))
        (i32.store (i32.mul (local.get $largest) (i32.const 4)) (local.get $tmp))
        (call $heapify (local.get $n) (local.get $largest)))))

  (func $heapsort (param $n i32)
    (local $i i32)
    (local $tmp i32)
    (local.set $i (i32.sub (i32.div_s (local.get $n) (i32.const 2)) (i32.const 1)))
    (block $break
      (loop $loop
        (br_if $break (i32.lt_s (local.get $i) (i32.const 0)))
        (call $heapify (local.get $n) (local.get $i))
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (br $loop)))
    (local.set $i (i32.sub (local.get $n) (i32.const 1)))
    (block $break2
      (loop $loop2
        (br_if $break2 (i32.le_s (local.get $i) (i32.const 0)))
        (local.set $tmp (i32.load (i32.const 0)))
        (i32.store (i32.const 0) (i32.load (i32.mul (local.get $i) (i32.const 4))))
        (i32.store (i32.mul (local.get $i) (i32.const 4)) (local.get $tmp))
        (call $heapify (local.get $i) (i32.const 0))
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (br $loop2))))

  (export "heapsort" (func $heapsort)))
