terra bucketSort(arr : &int, len : int, maxVal : int)
  var buckets : &int[maxVal]
  for i = 0, maxVal do
    buckets[i] = 0
  end
  for i = 0, len do
    if arr[i] >= 0 and arr[i] < maxVal then
      buckets[arr[i]] = buckets[arr[i]] + 1
    end
  end
  var result : &int[len]
  var idx = 0
  for i = 0, maxVal do
    for j = 0, buckets[i] do
      result[idx] = i
      idx = idx + 1
    end
  end
  return result
end
var test : int[6] = array(5, 2, 8, 1, 9, 3)
bucketSort(&test[0], 6, 10)