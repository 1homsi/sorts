(
var bogosort = { |arr|
  var sorted = false;
  while ({ sorted.not }, {
    var is_sorted = true;
    arr.do { |val, i|
      if (i < (arr.size - 1), {
        if (arr[i] > arr[i + 1], { is_sorted = false });
      });
    };
    sorted = is_sorted;
    if (sorted.not, { arr.shuffle });
  });
  arr;
};

var arr = [3, 1, 2];
(bogosort.value(arr)).postln;
)
