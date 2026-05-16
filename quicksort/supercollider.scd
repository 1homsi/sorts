(
var quicksort = { |arr|
  if (arr.size <= 1) {
    arr
  } {
    var pivot = arr[0];
    var less = [];
    var greater = [];
    arr.drop(1).do { |x|
      if (x <= pivot) {
        less = less ++ [x];
      } {
        greater = greater ++ [x];
      }
    };
    (quicksort.value(less)) ++ [pivot] ++ (quicksort.value(greater));
  }
};

quicksort.value([5, 2, 8, 1, 9, 3]).postln;
)