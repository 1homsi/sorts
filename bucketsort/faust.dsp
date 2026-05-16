process = ba.tabulate(10,
  environment {
    bucket_sort(arr, maxVal, idx) = 
      select2(idx < maxVal, 0, arr + 1);
  }.bucket_sort);