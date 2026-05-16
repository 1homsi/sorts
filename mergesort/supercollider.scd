(
var mergesort = { |arr|
  var merge = { |a, b|
    var result = [];
    var i = 0, j = 0;
    while { i < a.size and j < b.size } {
      if (a[i] <= b[j]) {
        result = result.add(a[i]);
        i = i + 1;
      } {
        result = result.add(b[j]);
        j = j + 1;
      };
    };
    result = result ++ a[i..];
    result = result ++ b[j..];
    result;
  };
  
  var sort = { |x|
    if (x.size <= 1) { x } {
      var mid = x.size div: 2;
      var left = sort.(x[0..mid-1]);
      var right = sort.(x[mid..]);
      merge.(left, right);
    };
  };
  
  sort.(arr);
};

mergesort.([5, 2, 8, 1, 9, 3]).postln;
)
