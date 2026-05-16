def counting_sort(arr)
  return arr if arr.empty?
  min, max = arr.min, arr.max
  range = max - min + 1
  count = Array.new(range, 0)
  arr.each { |v| count[v - min] += 1 }
  (1...range).each { |i| count[i] += count[i - 1] }
  output = Array.new(arr.length)
  arr.reverse_each do |v|
    count[v - min] -= 1
    output[count[v - min]] = v
  end
  output
end
p counting_sort([4, 2, 2, 8, 3, 3, 1])
