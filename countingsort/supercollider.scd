(
countingsort = { |arr|
  var max = 0;
  arr.do { |val|
    if (val > max) { max = val; };
  };

  var count = Array.fill(max + 1, 0);
  arr.do { |val|
    count[val] = count[val] + 1;
  };

  var output = [];
  (0..max).do { |i|
    count[i].do { |_|
      output = output ++ [i];
    };
  };

  output
};

[5, 2, 8, 1, 9, 3].postln;
countingsort.([5, 2, 8, 1, 9, 3]).postln;
)
