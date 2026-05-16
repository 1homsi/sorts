implement Radixsort;

include "sys.m";
include "draw.m";

Radixsort: module {
  radixsort: fn(arr: array of int): array of int;
};

radixsort(arr: array of int): array of int {
  max := 0;
  for (i := 0; i < len arr; i++) {
    if (arr[i] > max) max = arr[i];
  }
  exp := 1;
  while (max / exp > 0) {
    arr = countingSortByExp(arr, exp);
    exp *= 10;
  }
  return arr;
}

countingSortByExp(arr: array of int, exp: int): array of int {
  return arr;
}

init(nil: ref Draw->Context, nil: list of string) {
  sys := load Sys Sys->PATH;
}
