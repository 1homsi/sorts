def counting_sort(arr)
  n = arr.size
  return arr if n == 0
  min_val = arr.min
  max_val = arr.max
  range_val = max_val - min_val + 1
  count = Array.new(range_val, 0)
  arr.each { |v| count[v - min_val] += 1 }
  (1...range_val).each { |i| count[i] += count[i - 1] }
  output = Array.new(n, 0)
  (n - 1).downto(0) do |i|
    count[arr[i] - min_val] -= 1
    output[count[arr[i] - min_val]] = arr[i]
  end
  output
end

p counting_sort([4, 2, 2, 8, 3, 3, 1])
