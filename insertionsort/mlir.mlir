func.func @insertion_sort(%arr: memref<?xi32>, %n: i32) {
  %c1 = arith.constant 1 : index
  %c0 = arith.constant 0 : index
  %n_idx = arith.index_cast %n : i32 to index
  %i_init = arith.constant 1 : index
  scf.for %i = %i_init to %n_idx step %c1 {
    %key = memref.load %arr[%i] : memref<?xi32>
    %j_init = arith.subi %i, %c1 : index
    %j_final:2 = scf.while (%j = %j_init, %cont = %key) : (index, i32) -> (index, i32) {
      %ge = arith.cmpi sge, %j, %c0 : index
      scf.condition(%ge) %j, %cont : index, i32
    } do {
    ^bb0(%j: index, %cont: i32):
      %aj = memref.load %arr[%j] : memref<?xi32>
      %gt = arith.cmpi sgt, %aj, %cont : i32
      scf.if %gt {
        %j1 = arith.addi %j, %c1 : index
        memref.store %aj, %arr[%j1] : memref<?xi32>
      }
      %j_dec = arith.subi %j, %c1 : index
      scf.yield %j_dec, %cont : index, i32
    }
    %place = arith.addi %j_final#0, %c1 : index
    memref.store %key, %arr[%place] : memref<?xi32>
  }
  return
}
