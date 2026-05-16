to bucketSort
  let arr [5 2 8 1 9 3]
  let buckets n-values 10 [n-values 0 []]
  foreach arr [
    num -> set buckets replace-item num buckets 
      (lput num item num buckets)
  ]
  let result []
  foreach buckets [
    bucket -> set result sentence result bucket
  ]
  print result
end
bucketSort