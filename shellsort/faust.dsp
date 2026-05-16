process = shellsort
  with {
    shellsort = function(arr, gap) {
      (gap > 0) : gap / 3 : shellsort(arr, gap / 3)
                | gapsort(arr, gap, 0);
      gapsort(arr, gap, i) = (i < 6) : shellsort(arr, gap, i)
                           | arr;
    };
  };
