def insertion_sort(bucket : Array(Float64)) : Array(Float64)
  n = bucket.size
  (1...n).each do |i|
    key = bucket[i]
    j = i - 1
    while j >= 0 && bucket[j] > key
      bucket[j + 1] = bucket[j]
      j -= 1
    end
    bucket[j + 1] = key
  end
  bucket
end

def bucket_sort(arr : Array(Float64)) : Array(Float64)
  n = arr.size
  return arr if n == 0
  min_v = arr.min
  max_v = arr.max
  buckets = Array(Array(Float64)).new(n) { [] of Float64 }
  arr.each do |num|
    idx = ((num - min_v) / (max_v - min_v + 1) * n).to_i
    idx = n - 1 if idx >= n
    buckets[idx] << num
  end
  buckets.flat_map { |b| insertion_sort(b) }
end

p bucket_sort([0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68])
