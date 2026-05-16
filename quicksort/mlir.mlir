func.func @partition(%arr: memref<?xi32>, %low: index, %high: index) -> index {
  %pivot_ptr = memref.load %arr[%high] : memref<?xi32>
  %i = memref.alloca() : memref<index>
  memref.store %low, %i[] : memref<index>
  %c1 = arith.constant 1 : index
  scf.for %j = %low to %high step %c1 {
    %vj = memref.load %arr[%j] : memref<?xi32>
    %cond = arith.cmpi sle, %vj, %pivot_ptr : i32
    scf.if %cond {
      %iv = memref.load %i[] : memref<index>
      %vi = memref.load %arr[%iv] : memref<?xi32>
      memref.store %vj, %arr[%iv] : memref<?xi32>
      memref.store %vi, %arr[%j] : memref<?xi32>
      %iv1 = arith.addi %iv, %c1 : index
      memref.store %iv1, %i[] : memref<index>
    }
  }
  %i_final = memref.load %i[] : memref<index>
  %vi = memref.load %arr[%i_final] : memref<?xi32>
  %vh = memref.load %arr[%high] : memref<?xi32>
  memref.store %pivot_ptr, %arr[%i_final] : memref<?xi32>
  memref.store %vi, %arr[%high] : memref<?xi32>
  return %i_final : index
}

func.func @quicksort(%arr: memref<?xi32>, %low: index, %high: index) {
  %cond = arith.cmpi slt, %low, %high : index
  scf.if %cond {
    %p = func.call @partition(%arr, %low, %high) : (memref<?xi32>, index, index) -> index
    %c1 = arith.constant 1 : index
    %pm1 = arith.subi %p, %c1 : index
    func.call @quicksort(%arr, %low, %pm1) : (memref<?xi32>, index, index) -> ()
    %pp1 = arith.addi %p, %c1 : index
    func.call @quicksort(%arr, %pp1, %high) : (memref<?xi32>, index, index) -> ()
  }
  return
}
