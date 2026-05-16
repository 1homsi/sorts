process = component("TimSort.dsp");

timsort(arr, minSize) = mergesort(arr, minSize);

mergesort(arr, minSize) = 
  select3(condition,
    arr,
    insertionsort(arr),
    merge(mergesort(left, minSize), mergesort(right, minSize))
  )
  with {
    condition = select2(arr_len <= 1, 1, select2(arr_len <= minSize, 2, 3));
    arr_len = ba.count(arr);
    mid = arr_len / 2;
    left = ba.slice(arr, 0, mid);
    right = ba.slice(arr, mid, arr_len - mid);
  };

insertionsort(arr) = insertion_loop(arr, 1)
  with {
    insertion_loop(a, i) = select2(i < ba.count(a),
      insert_element(a, i),
      a
    );
  };

merge(left, right) = merge_loop(left, right, 0, 0, ())
  with {
    merge_loop(l, r, i, j, result) =
      select3(merge_cond(l, r, i, j),
        merge_loop(l, r, i+1, j, append(result, l, i)),
        merge_loop(l, r, i, j+1, append(result, r, j)),
        finalize(result, l, r, i, j)
      );
    
    merge_cond(l, r, i, j) = select2(i < ba.count(l) & j < ba.count(r),
      select2(ba.take(l, i) <= ba.take(r, j), 1, 2),
      3
    );
  };
