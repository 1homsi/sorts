(
comb_sort = { |arr|
  var gap = arr.size;
  var result = arr.copy;
  loop {
    gap = (gap * 10 / 13).asInteger;
    if (gap < 1) { gap = 1 };
    var swapped = false;
    for (0, (result.size - gap - 1), { |i|
      if (result[i] > result[i + gap]) {
        var temp = result[i];
        result[i] = result[i + gap];
        result[i + gap] = temp;
        swapped = true;
      };
    });
    (gap == 1 and swapped.not).if { break };
  };
  result;
};

var sample = [5, 2, 8, 1, 9, 3];
sample.postln;
comb_sort.(sample).postln;
)
