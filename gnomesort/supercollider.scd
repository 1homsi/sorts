(
gnomesort = { |arr|
  var i = 0;
  while { i < arr.size } {
    if (i == 0) {
      i = i + 1;
    } {
      if (arr[i] < arr[i - 1]) {
        var temp = arr[i];
        arr[i] = arr[i - 1];
        arr[i - 1] = temp;
        i = i - 1;
      } {
        i = i + 1;
      }
    }
  };
  arr
};

var test = [5, 2, 8, 1, 9, 3];
(gnomesort.(test)).postln;
)
