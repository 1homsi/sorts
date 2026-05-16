implement Stoogesort;

include "sys.m";
include "draw.m";

Stoogesort: module
{
  path: con "/dis/stoogesort.dis";
  
  stoogesort: fn(a: array of int, i, j: int);
};

stoogesort(a: array of int, i, j: int)
{
  if (a[j] < a[i]) {
    t := a[j];
    a[j] = a[i];
    a[i] = t;
  }
  if (j - i > 1) {
    t := (j - i + 1) / 3;
    stoogesort(a, i, j - t);
    stoogesort(a, i + t, j);
    stoogesort(a, i, j - t);
  }
}
