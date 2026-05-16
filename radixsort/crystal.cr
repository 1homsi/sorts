def counting_sort(arr : Array(Int32), exp : Int32) : Nil
  n = arr.size
  output = Array.new(n, 0)
  count = Array.new(10, 0)
  arr.each { |x| count[(x // exp) % 10] += 1 }
  (1...10).each { |i| count[i] += count[i - 1] }
  (n - 1).downto(0) do |i|
    idx = (arr[i] // exp) % 10
    count[idx] -= 1
    output[count[idx]] = arr[i]
  end
  n.times { |i| arr[i] = output[i] }
end

def radix_sort(arr : Array(Int32)) : Array(Int32)
  return arr if arr.empty?
  max = arr.max
  exp = 1
  while max // exp > 0
    counting_sort(arr, exp)
    exp *= 10
  end
  arr
end

arr = [170, 45, 75, 90, 802, 24, 2, 66]
p radix_sort(arr)
