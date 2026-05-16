define void @insertion_sort(i32* %arr, i32 %n) {
entry:
  br label %outer.check
outer.check:
  %i = phi i32 [ 1, %entry ], [ %i.next, %outer.inc ]
  %cond = icmp slt i32 %i, %n
  br i1 %cond, label %outer.body, label %exit
outer.body:
  %key.ptr = getelementptr i32, i32* %arr, i32 %i
  %key = load i32, i32* %key.ptr
  %j.init = sub i32 %i, 1
  br label %inner.check
inner.check:
  %j = phi i32 [ %j.init, %outer.body ], [ %j.dec, %inner.shift ]
  %j.ge = icmp sge i32 %j, 0
  br i1 %j.ge, label %inner.load, label %inner.exit
inner.load:
  %aj.ptr = getelementptr i32, i32* %arr, i32 %j
  %aj = load i32, i32* %aj.ptr
  %gt = icmp sgt i32 %aj, %key
  br i1 %gt, label %inner.shift, label %inner.exit
inner.shift:
  %j1 = add i32 %j, 1
  %aj1.ptr = getelementptr i32, i32* %arr, i32 %j1
  store i32 %aj, i32* %aj1.ptr
  %j.dec = sub i32 %j, 1
  br label %inner.check
inner.exit:
  %j.final = phi i32 [ %j, %inner.check ], [ %j, %inner.load ]
  %place = add i32 %j.final, 1
  %place.ptr = getelementptr i32, i32* %arr, i32 %place
  store i32 %key, i32* %place.ptr
  %i.next = add i32 %i, 1
  br label %outer.inc
outer.inc:
  br label %outer.check
exit:
  ret void
}
