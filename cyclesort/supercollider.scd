(
var cycleSort = { |arr|
  var n = arr.size;
  var pos = 0;
  while { pos < n } {
    var item = arr[pos];
    var cycles = 0;
    for (0, n-1, { |i|
      if (i != pos && arr[i] < item) { cycles = cycles + 1; }
    });
    if (cycles != 0) {
      while { arr[pos] == item } { pos = pos + 1; };
      arr.swapAt(pos, item);
      item = arr[pos];
      while { cycles > 0 } {
        cycles = 0;
        for (0, n-1, { |i|
          if (i != pos && arr[i] < item) { cycles = cycles + 1; }
        });
        while { arr[pos] == item } { pos = pos + 1; };
        arr.swapAt(pos, item);
        item = arr[pos];
        cycles = cycles - 1;
      }
    };
    pos = pos + 1;
  };
  arr
};

var result = cycleSort.([5, 2, 8, 1, 9, 3]);
result.postln;
)
