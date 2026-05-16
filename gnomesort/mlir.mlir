module {
  func.func @gnome_sort(%arg0: memref<?xi32>, %n: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %i = memref.alloca() : memref<index>
    memref.store %c0, %i[] : memref<index>
    cf.br ^loop

  ^loop:
    %iv = memref.load %i[] : memref<index>
    %done = arith.cmpi sge, %iv, %n : index
    cf.cond_br %done, ^exit, ^body

  ^body:
    %is_zero = arith.cmpi eq, %iv, %c0 : index
    cf.cond_br %is_zero, ^advance, ^check

  ^check:
    %prev = arith.subi %iv, %c1 : index
    %cur_val = memref.load %arg0[%iv] : memref<?xi32>
    %prv_val = memref.load %arg0[%prev] : memref<?xi32>
    %ge = arith.cmpi sge, %cur_val, %prv_val : i32
    cf.cond_br %ge, ^advance, ^swap

  ^swap:
    memref.store %prv_val, %arg0[%iv] : memref<?xi32>
    memref.store %cur_val, %arg0[%prev] : memref<?xi32>
    memref.store %prev, %i[] : memref<index>
    cf.br ^loop

  ^advance:
    %next = arith.addi %iv, %c1 : index
    memref.store %next, %i[] : memref<index>
    cf.br ^loop

  ^exit:
    return
  }
}
