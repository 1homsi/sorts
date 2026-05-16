func.func @selection_sort(%arg0: memref<?xi32>, %n: i32) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %n_idx = arith.index_cast %n : i32 to index
  
  scf.for %i = %c0 to %n_idx step %c1 {
    %min_idx = memref.alloca() : memref<index>
    memref.store %i, %min_idx[] : memref<index>
    %i_1 = arith.addi %i, %c1 : index
    
    scf.for %j = %i_1 to %n_idx step %c1 {
      %cur_min = memref.load %min_idx[] : memref<index>
      %v_j = memref.load %arg0[%j] : memref<?xi32>
      %v_min = memref.load %arg0[%cur_min] : memref<?xi32>
      %less = arith.cmpi slt, %v_j, %v_min : i32
      scf.if %less {
        memref.store %j, %min_idx[] : memref<index>
      }
    }
    
    %final_min = memref.load %min_idx[] : memref<index>
    %v_i = memref.load %arg0[%i] : memref<?xi32>
    %v_m = memref.load %arg0[%final_min] : memref<?xi32>
    memref.store %v_m, %arg0[%i] : memref<?xi32>
    memref.store %v_i, %arg0[%final_min] : memref<?xi32>
  }
  
  return
}
