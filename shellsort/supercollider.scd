(
var shellsort = { |arr|
  var n = arr.size;
  var gap = 1;
  while { gap <= n } { gap = gap * 3 + 1 };
  while { gap > 0 } {
    gap = (gap / 3).asInteger;
    (gap .. n - 1).do { |i|
      var temp = arr[i];
      var j = i;
      while { j >= gap && arr[j - gap] > temp } {
        arr[j] = arr[j - gap];
        j = j - gap;
      };
      arr[j] = temp;
    };
  };
  arr;
};
shellsort.([5, 2, 8, 1, 9, 3]).postln;
)