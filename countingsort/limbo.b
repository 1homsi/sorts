implement Countingsort;

include "sys.m";
sys: Sys;

countingsort(arr: list of int): list of int
{
  max := 0;
  for (; arr != nil; arr = tl arr)
    if (hd arr > max)
      max = hd arr;

  count := array[max + 1] of {* => 0};
  arr2 := arr;
  for (; arr2 != nil; arr2 = tl arr2)
    count[hd arr2]++;

  output: list of int = nil;
  for (i := max; i >= 0; i--)
    for (j := 0; j < count[i]; j++)
      output = i :: output;

  return output;
}

init(nil: ref Draw->Context, nil: list of string)
{
  sys = load Sys Sys->PATH;
  test := 5 :: 2 :: 8 :: 1 :: 9 :: 3 :: nil;
  sys->print("%v\n", countingsort(test));
}
