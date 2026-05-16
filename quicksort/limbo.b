implement Quicksort;

include "sys.m";
include "draw.m";

Quicksort: module {
  quicksort: fn(arr: array of int): array of int;
};

quicksort(arr: array of int): array of int {
  if (len arr <= 1)
    return arr;

  pivot := arr[0];
  less := array[0] of int;
  greater := array[0] of int;

  for (i := 1; i < len arr; i++) {
    if (arr[i] <= pivot)
      less = (array of int) arr[i] + less;
    else
      greater = (array of int) arr[i] + greater;
  }

  r := quicksort(less) + array[1] of { pivot } + quicksort(greater);
  return r;
}