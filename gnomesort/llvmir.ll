define void @gnome_sort(ptr %arr, i32 %n) {
entry:
  %i = alloca i32
  store i32 0, ptr %i
  br label %loop

loop:
  %i_val = load i32, ptr %i
  %cmp = icmp sge i32 %i_val, %n
  br i1 %cmp, label %done, label %body

body:
  %is_zero = icmp eq i32 %i_val, 0
  br i1 %is_zero, label %advance, label %check

check:
  %idx = sext i32 %i_val to i64
  %prev = sub i64 %idx, 1
  %ptr_cur = getelementptr i32, ptr %arr, i64 %idx
  %ptr_prv = getelementptr i32, ptr %arr, i64 %prev
  %cur = load i32, ptr %ptr_cur
  %prv = load i32, ptr %ptr_prv
  %ge = icmp sge i32 %cur, %prv
  br i1 %ge, label %advance, label %swap

swap:
  store i32 %prv, ptr %ptr_cur
  store i32 %cur, ptr %ptr_prv
  %i_dec = sub i32 %i_val, 1
  store i32 %i_dec, ptr %i
  br label %loop

advance:
  %i_inc = add i32 %i_val, 1
  store i32 %i_inc, ptr %i
  br label %loop

done:
  ret void
}
