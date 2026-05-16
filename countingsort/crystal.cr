def counting_sort(arr : Array(Int32)) : Array(Int32)
  return arr if arr.empty?
  min = arr.min
  max = arr.max
  range = max - min + 1
  count = Array.new(range, 0)
  arr.each { |v| count[v - min] += 1 }
  (1...range).each { |i| count[i] += count[i - 1] }
  output = Array.new(arr.size, 0)
  arr.reverse_each do |v|
    count[v - min] -= 1
    output[count[v - min]] = v
  end
  output
end

p counting_sort([4, 2, 2, 8, 3, 3, 1])
