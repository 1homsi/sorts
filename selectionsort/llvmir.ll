define void @selection_sort(i32* %arr, i32 %n) {
entry:
  br label %outer.head

outer.head:
  %i = phi i32 [ 0, %entry ], [ %i.next, %outer.latch ]
  %cond = icmp slt i32 %i, %n
  br i1 %cond, %outer.body, %exit

outer.body:
  %min_idx = alloca i32
  store i32 %i, i32* %min_idx
  %j.init = add i32 %i, 1
  br label %inner.head

inner.head:
  %j = phi i32 [ %j.init, %outer.body ], [ %j.next, %inner.latch ]
  %inner.cond = icmp slt i32 %j, %n
  br i1 %inner.cond, %inner.body, %swap

inner.body:
  %gep_j = getelementptr i32, i32* %arr, i32 %j
  %val_j = load i32, i32* %gep_j
  %min_idx.val = load i32, i32* %min_idx
  %gep_min = getelementptr i32, i32* %arr, i32 %min_idx.val
  %val_min = load i32, i32* %gep_min
  %less = icmp slt i32 %val_j, %val_min
  br i1 %less, %update_min, %inner.latch

update_min:
  store i32 %j, i32* %min_idx
  br label %inner.latch

inner.latch:
  %j.next = add i32 %j, 1
  br label %inner.head

swap:
  %min_final = load i32, i32* %min_idx
  %gep_i = getelementptr i32, i32* %arr, i32 %i
  %gep_m = getelementptr i32, i32* %arr, i32 %min_final
  %tmp = load i32, i32* %gep_i
  %tmp2 = load i32, i32* %gep_m
  store i32 %tmp2, i32* %gep_i
  store i32 %tmp, i32* %gep_m
  br label %outer.latch

outer.latch:
  %i.next = add i32 %i, 1
  br label %outer.head

exit:
  ret void
}
