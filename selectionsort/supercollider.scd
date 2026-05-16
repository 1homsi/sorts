(
var selectionSort = { |arr|
  var n = arr.size;
  var minIdx, tmp;
  (0..n-2).do { |i|
    minIdx = i;
    (i+1..n-1).do { |j|
      if (arr[j] < arr[minIdx]) { minIdx = j; }
    };
    tmp = arr[i];
    arr[i] = arr[minIdx];
    arr[minIdx] = tmp;
  };
  arr
};

(selectionSort.([5, 2, 8, 1, 9, 3])).postln;
)