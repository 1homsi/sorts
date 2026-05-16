(
timsort = { |arr, minSize=32|
  var mergesort;
  mergesort = { |a|
    if(a.size <= 1) {
      a
    } {
      if(a.size <= minSize) {
        insertionsort.value(a)
      } {
        var mid = (a.size / 2).asInteger;
        var left = a[0..mid-1];
        var right = a[mid..a.size-1];
        merge.value(mergesort.value(left), mergesort.value(right))
      }
    }
  };
  mergesort.value(arr)
};

insertionsort = { |arr|
  var result = arr.copy;
  (1..result.size-1).do { |i|
    var key = result[i];
    var j = i - 1;
    while({ j >= 0 && result[j] > key }) {
      result[j + 1] = result[j];
      j = j - 1;
    };
    result[j + 1] = key;
  };
  result
};

merge = { |left, right|
  var result = [];
  var i = 0;
  var j = 0;
  while({ i < left.size && j < right.size }) {
    if(left[i] <= right[j]) {
      result = result ++ [left[i]];
      i = i + 1;
    } {
      result = result ++ [right[j]];
      j = j + 1;
    }
  };
  while({ i < left.size }) {
    result = result ++ [left[i]];
    i = i + 1;
  };
  while({ j < right.size }) {
    result = result ++ [right[j]];
    j = j + 1;
  };
  result
};

timsort.value([5, 2, 8, 1, 9, 3]).postln;
)
