(module
  (memory (export "memory") 1)

  (func $merge (param $lo i32) (param $mid i32) (param $hi i32)
    (local $i i32) (local $j i32) (local $k i32) (local $tmp_base i32)
    local.get $hi
    i32.const 1
    i32.add
    i32.const 4
    i32.mul
    local.set $tmp_base

    local.get $lo
    local.set $i
    local.get $mid
    i32.const 1
    i32.add
    local.set $j
    local.get $lo
    local.set $k

    block $break
      loop $loop
        local.get $i
        local.get $mid
        i32.gt_s
        local.get $j
        local.get $hi
        i32.gt_s
        i32.or
        br_if $break

        local.get $i
        i32.const 4
        i32.mul
        i32.load

        local.get $j
        i32.const 4
        i32.mul
        i32.load

        i32.le_s
        if
          local.get $tmp_base
          local.get $k
          i32.const 4
          i32.mul
          i32.add
          local.get $i
          i32.const 4
          i32.mul
          i32.load
          i32.store
          local.get $i
          i32.const 1
          i32.add
          local.set $i
        else
          local.get $tmp_base
          local.get $k
          i32.const 4
          i32.mul
          i32.add
          local.get $j
          i32.const 4
          i32.mul
          i32.load
          i32.store
          local.get $j
          i32.const 1
          i32.add
          local.set $j
        end
        local.get $k
        i32.const 1
        i32.add
        local.set $k
        br $loop
      end
    end

    block $break2
      loop $loop2
        local.get $i
        local.get $mid
        i32.gt_s
        br_if $break2
        local.get $tmp_base
        local.get $k
        i32.const 4
        i32.mul
        i32.add
        local.get $i
        i32.const 4
        i32.mul
        i32.load
        i32.store
        local.get $i
        i32.const 1
        i32.add
        local.set $i
        local.get $k
        i32.const 1
        i32.add
        local.set $k
        br $loop2
      end
    end

    block $break3
      loop $loop3
        local.get $j
        local.get $hi
        i32.gt_s
        br_if $break3
        local.get $tmp_base
        local.get $k
        i32.const 4
        i32.mul
        i32.add
        local.get $j
        i32.const 4
        i32.mul
        i32.load
        i32.store
        local.get $j
        i32.const 1
        i32.add
        local.set $j
        local.get $k
        i32.const 1
        i32.add
        local.set $k
        br $loop3
      end
    end

    local.get $lo
    local.set $i
    block $break4
      loop $loop4
        local.get $i
        local.get $hi
        i32.gt_s
        br_if $break4
        local.get $i
        i32.const 4
        i32.mul
        local.get $tmp_base
        local.get $i
        i32.const 4
        i32.mul
        i32.add
        i32.load
        i32.store
        local.get $i
        i32.const 1
        i32.add
        local.set $i
        br $loop4
      end
    end
  )

  (func $merge_sort (param $lo i32) (param $hi i32)
    (local $mid i32)
    local.get $lo
    local.get $hi
    i32.ge_s
    if return end
    local.get $lo
    local.get $hi
    i32.add
    i32.const 2
    i32.div_s
    local.set $mid
    local.get $lo
    local.get $mid
    call $merge_sort
    local.get $mid
    i32.const 1
    i32.add
    local.get $hi
    call $merge_sort
    local.get $lo
    local.get $mid
    local.get $hi
    call $merge
  )

  (func (export "sort") (param $n i32)
    i32.const 0
    local.get $n
    i32.const 1
    i32.sub
    call $merge_sort
  )
)
