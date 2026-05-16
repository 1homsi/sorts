implement Gnomesort;

include "sys.m";
sys: Sys;

gnomesort(arr: array of int) {
  i := 0;
  while (i < len arr) {
    if (i == 0) {
      i++;
    } else if (arr[i] < arr[i - 1]) {
      temp := arr[i];
      arr[i] = arr[i - 1];
      arr[i - 1] = temp;
      i--;
    } else {
      i++;
    }
  }
}

init(nil: ref Draw->Context, nil: list of string) {
  sys = load Sys Sys->PATH;
  arr := array[6] of {5, 2, 8, 1, 9, 3};
  gnomesort(arr);
  for (i := 0; i < len arr; i++) {
    sys->print("%d ", arr[i]);
  }
}
