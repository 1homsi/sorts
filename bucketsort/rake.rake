def insertion_sort(bucket)
  (1...bucket.length).each do |i|
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

def bucket_sort(arr)
  return arr if arr.empty?
  n = arr.length
  min_v, max_v = arr.min, arr.max
  buckets = Array.new(n) { [] }
  arr.each do |num|
    idx = ((num - min_v).to_f / (max_v - min_v + 1) * n).to_i
    idx = n - 1 if idx >= n
    buckets[idx] << num
  end
  buckets.flat_map { |b| insertion_sort(b) }
end

task :sort do
  data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
  puts bucket_sort(data).inspect
end

task default: :sort
