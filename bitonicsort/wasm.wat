(module
  (memory (export "memory") 1)

  (func $compare_and_swap (param $i i32) (param $j i32) (param $dir i32)
    (local $ai i32)
    (local $aj i32)
    local.get $i
    i32.const 4
    i32.mul
    i32.load
    local.set $ai
    local.get $j
    i32.const 4
    i32.mul
    i32.load
    local.set $aj
    local.get $dir
    local.get $ai
    local.get $aj
    i32.gt_s
    i32.eq
    if
      local.get $i
      i32.const 4
      i32.mul
      local.get $aj
      i32.store
      local.get $j
      i32.const 4
      i32.mul
      local.get $ai
      i32.store
    end
  )

  (func $bitonic_merge (param $lo i32) (param $cnt i32) (param $dir i32)
    (local $k i32)
    (local $i i32)
    local.get $cnt
    i32.const 1
    i32.le_s
    if return end
    local.get $cnt
    i32.const 2
    i32.div_s
    local.set $k
    local.get $lo
    local.set $i
    block $break
      loop $loop
        local.get $i
        local.get $lo
        local.get $k
        i32.add
        i32.ge_s
        br_if $break
        local.get $i
        local.get $i
        local.get $k
        i32.add
        local.get $dir
        call $compare_and_swap
        local.get $i
        i32.const 1
        i32.add
        local.set $i
        br $loop
      end
    end
    local.get $lo
    local.get $k
    local.get $dir
    call $bitonic_merge
    local.get $lo
    local.get $k
    i32.add
    local.get $k
    local.get $dir
    call $bitonic_merge
  )

  (func $bitonic_sort (export "bitonic_sort") (param $lo i32) (param $cnt i32) (param $dir i32)
    (local $k i32)
    local.get $cnt
    i32.const 1
    i32.le_s
    if return end
    local.get $cnt
    i32.const 2
    i32.div_s
    local.set $k
    local.get $lo
    local.get $k
    i32.const 1
    call $bitonic_sort
    local.get $lo
    local.get $k
    i32.add
    local.get $k
    i32.const 0
    call $bitonic_sort
    local.get $lo
    local.get $cnt
    local.get $dir
    call $bitonic_merge
  )
)
