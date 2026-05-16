def counting_sort(arr, exp)
  n = arr.length
  output = Array.new(n, 0)
  count = Array.new(10, 0)
  arr.each { |x| count[(x / exp) % 10] += 1 }
  (1..9).each { |i| count[i] += count[i - 1] }
  (n - 1).downto(0) do |i|
    idx = (arr[i] / exp) % 10
    count[idx] -= 1
    output[count[idx]] = arr[i]
  end
  arr.replace(output)
end

def radix_sort(arr)
  return arr if arr.empty?
  max = arr.max
  exp = 1
  while max / exp > 0
    counting_sort(arr, exp)
    exp *= 10
  end
  arr
end

task :default do
  arr = [170, 45, 75, 90, 802, 24, 2, 66]
  p radix_sort(arr)
end
