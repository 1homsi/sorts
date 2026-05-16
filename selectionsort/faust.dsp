import("stdfaust.lib");

selection_sort(arr) = process
  with {
    n = ba.count(arr);
    sort_loop(i, arr) = select2(i >= n - 1,
      arr,
      sort_loop(i + 1,
        swap_min(i, i + 1, n, arr)
      )
    );
    swap_min(i, j, n, arr) = select2(j >= n,
      arr,
      swap_min(i, j + 1, n,
        select2(ba.get(arr, j) < ba.get(arr, i),
          swap_elements(arr, i, j),
          arr
        )
      )
    );
  };