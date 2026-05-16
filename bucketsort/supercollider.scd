(
f = { |arr, maxVal|
  var buckets = Array.new(maxVal, {Array.new});
  arr.do { |num|
    var idx = num;
    if (idx >= 0 and: {idx < maxVal}) {
      buckets[idx] = buckets[idx] ++ [num];
    };
  };
  var result = [];
  buckets.do { |bucket|
    result = result ++ bucket;
  };
  result;
};
(f.value([5, 2, 8, 1, 9, 3], 10)).postln;
)