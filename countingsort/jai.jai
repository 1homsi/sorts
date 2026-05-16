countingsort :: (arr: [] int) -> [] int {
  if arr.count == 0 return arr;

  max := 0;
  for val in arr {
    if val > max max = val;
  }

  count := alloc(max + 1);
  for i in 0..max {
    count[i] = 0;
  }

  for val in arr {
    count[val] += 1;
  }

  output: [dynamic] int;
  for i in 0..max {
    for _j in 0..<count[i] {
      array_add(*output, i);
    }
  }

  return output[:];
}

main :: () {
  test := int.[5, 2, 8, 1, 9, 3];
  result := countingsort(test);
  print(result);
}
