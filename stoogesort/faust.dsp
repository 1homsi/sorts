stoogesort(a, i, j) = stoogesort_impl
  with {
    stoogesort_impl = select2(j - i > 1,
      select2(a[j] < a[i], a, swap_array),
      recursive_sort
    );
    swap_array = array_swap(a, i, j);
    recursive_sort = stoogesort(
      stoogesort(stoogesort(a, i, j - t), i + t, j),
      i, j - t
    ) with { t = (j - i + 1) / 3; };
  };

process = stoogesort([5,2,8,1,9,3], 0, 5);
