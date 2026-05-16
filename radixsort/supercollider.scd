(
radixsort = { |arr|
  var max = arr.maxItem;
  var exp = 1;
  var result = arr.copy;
  while ({ max / exp > 0 }, {
    result = result.countingSortByExp(exp);
    exp = exp * 10;
  });
  result;
};

Array.addMethod(\countingSortByExp, { |this, exp|
  var n = this.size;
  var output = Array.newClear(n);
  var count = Array.fill(10, 0);
  this.do({ |x, i| count[(x / exp).asInteger % 10] = count[(x / exp).asInteger % 10] + 1 });
  1.do({ |i| count[i] = count[i] + count[i - 1] });
  (n - 1).do({ |i|
    output[count[(this[i] / exp).asInteger % 10] - 1] = this[i];
    count[(this[i] / exp).asInteger % 10] = count[(this[i] / exp).asInteger % 10] - 1;
  });
  output;
});

radixsort.([5, 2, 8, 1, 9, 3]).postln;
)
