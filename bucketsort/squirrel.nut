function bucketSort(arr, maxVal) {
  if (maxVal == 0) return arr;
  local buckets = array(maxVal);
  for (local i = 0; i < maxVal; i++) {
    buckets[i] = [];
  }
  foreach (num in arr) {
    local idx = num;
    if (idx >= 0 && idx < maxVal) {
      buckets[idx].append(num);
    }
  }
  local result = [];
  for (local i = 0; i < maxVal; i++) {
    foreach (num in buckets[i]) {
      result.append(num);
    }
  }
  return result;
}
print(bucketSort([5, 2, 8, 1, 9, 3], 10));