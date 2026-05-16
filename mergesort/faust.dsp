import("stdfaust.lib");

mergesort(arr) = arr : process;

process = 
  (5, 2, 8, 1, 9, 3) : 
  mergesort : 
  _;
