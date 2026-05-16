define i32 @partition(i32* %arr, i32 %low, i32 %high) {
entry:
  %pivot_ptr = getelementptr i32, i32* %arr, i32 %high
  %pivot = load i32, i32* %pivot_ptr
  %i = alloca i32
  store i32 %low, i32* %i
  br label %loop_check

loop_check:
  %j = phi i32 [%low, %entry], [%j_next, %loop_body]
  %cond = icmp slt i32 %j, %high
  br i1 %cond, label %loop_body, label %loop_end

loop_body:
  %arr_j = getelementptr i32, i32* %arr, i32 %j
  %val_j = load i32, i32* %arr_j
  %cond2 = icmp sle i32 %val_j, %pivot
  br i1 %cond2, label %do_swap, label %no_swap

do_swap:
  %i_val = load i32, i32* %i
  %arr_i = getelementptr i32, i32* %arr, i32 %i_val
  %val_i = load i32, i32* %arr_i
  store i32 %val_j, i32* %arr_i
  store i32 %val_i, i32* %arr_j
  %i_inc = add i32 %i_val, 1
  store i32 %i_inc, i32* %i
  br label %no_swap

no_swap:
  %j_next = add i32 %j, 1
  br label %loop_check

loop_end:
  %i_final = load i32, i32* %i
  %arr_i2 = getelementptr i32, i32* %arr, i32 %i_final
  %val_i2 = load i32, i32* %arr_i2
  store i32 %pivot, i32* %arr_i2
  store i32 %val_i2, i32* %pivot_ptr
  ret i32 %i_final
}

define void @quicksort(i32* %arr, i32 %low, i32 %high) {
entry:
  %cond = icmp slt i32 %low, %high
  br i1 %cond, label %do_sort, label %done

do_sort:
  %p = call i32 @partition(i32* %arr, i32 %low, i32 %high)
  %p_minus1 = sub i32 %p, 1
  call void @quicksort(i32* %arr, i32 %low, i32 %p_minus1)
  %p_plus1 = add i32 %p, 1
  call void @quicksort(i32* %arr, i32 %p_plus1, i32 %high)
  br label %done

done:
  ret void
}

@arr = global [7 x i32] [i32 3, i32 6, i32 8, i32 10, i32 1, i32 2, i32 1]

define i32 @main() {
  %ptr = getelementptr [7 x i32], [7 x i32]* @arr, i32 0, i32 0
  call void @quicksort(i32* %ptr, i32 0, i32 6)
  ret i32 0
}
