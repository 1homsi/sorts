def counting_sort: arr {
  n = arr size
  n == 0 if_true: { return arr }
  min = arr reduce: { |acc, v| v < acc if_true: { v } else: { acc } }
  max = arr reduce: { |acc, v| v > acc if_true: { v } else: { acc } }
  range = max - min + 1
  count = (0 upto: range - 1) map: { 0 }
  arr each: { |v|
    idx = v - min
    count[idx] = count[idx] + 1
  }
  (1 upto: range - 1) each: { |i|
    count[i] = count[i] + count[i - 1]
  }
  output = (0 upto: n - 1) map: { 0 }
  (n - 1 downto: 0) each: { |i|
    v = arr[i]
    idx = v - min
    count[idx] = count[idx] - 1
    output[count[idx]] = v
  }
  output
}

counting_sort([4, 2, 2, 8, 3, 3, 1]) println
