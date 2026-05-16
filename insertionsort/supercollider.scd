InsertionSort {
  *sort { |arr|
    var n = arr.size;
    (1..n-1).do { |i|
      var key = arr[i];
      var j = i - 1;
      while { j >= 0 and: { arr[j] > key } } {
        arr[j + 1] = arr[j];
        j = j - 1;
      };
      arr[j + 1] = key;
    };
    ^arr;
  }
}

InsertionSort.sort([5, 2, 8, 1, 9, 3]).postln;