(
stoogesort = {|a, i, j|
  var t;
  if (a[j] < a[i]) {
    a.swap(i, j);
  };
  if ((j - i) > 1) {
    t = ((j - i + 1) / 3).asInteger;
    stoogesort.(a, i, j - t);
    stoogesort.(a, i + t, j);
    stoogesort.(a, i, j - t);
  };
};

var arr = [5, 2, 8, 1, 9, 3];
stoogesort.(arr, 0, 5);
arr.postln;
)
