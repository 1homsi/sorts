implement Bogosort;

include "sys.m";
include "draw.m";

Bogosort: module {
  init: fn(nil: ref Draw->Context, nil: list of string);
};

init(nil: ref Draw->Context, nil: list of string) {
  arr := array[] of {3, 1, 2};

  while (!issorted(arr)) {
    shuffle(arr);
  }
}

issorted(arr: array of int): int {
  for (i := 0; i < len(arr) - 1; i++) {
    if (arr[i] > arr[i+1]) {
      return 0;
    }
  }
  return 1;
}

shuffle(arr: array of int) {
  for (i := 0; i < len(arr); i++) {
    j := int(rand() % len(arr));
    tmp := arr[i];
    arr[i] = arr[j];
    arr[j] = tmp;
  }
}
