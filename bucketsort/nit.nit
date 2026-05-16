module bucket_sort
var arr = [5, 2, 8, 1, 9, 3]
var max_val = 10
var buckets = new Array[Array[Int]](max_val)
for i in [0..max_val[ do buckets[i] = new Array[Int]
for num in arr do
  var idx = num
  if idx >= 0 and idx < max_val then
    buckets[idx].add(num)
  end
end
var result = new Array[Int]
for bucket in buckets do
  for num in bucket do
    result.add(num)
  end
end
print result