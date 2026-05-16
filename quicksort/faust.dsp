import("stdfaust.lib");

qsort(arr, n) = _ : _ with {
  qsort_inner(1) = arr;
  qsort_inner(n) = qsort_inner(n-1);
};

process = qsort((5,2,8,1,9,3), 6);