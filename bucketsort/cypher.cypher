WITH [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68] AS arr
WITH arr,
     reduce(mn = arr[0], x IN arr | CASE WHEN x < mn THEN x ELSE mn END) AS minV,
     reduce(mx = arr[0], x IN arr | CASE WHEN x > mx THEN x ELSE mx END) AS maxV,
     size(arr) AS n
WITH arr, minV, maxV, n,
     [x IN arr | toInteger(floor((x - minV) / (maxV - minV + 1) * n))] AS idxs
WITH arr, minV, maxV, n, idxs,
     range(0, n-1) AS bucket_ids
UNWIND bucket_ids AS bid
WITH bid, [i IN range(0, n-1) WHERE idxs[i] = bid | arr[i]] AS bucket
WITH bid, apoc.coll.sort(bucket) AS sorted_bucket
ORDER BY bid
RETURN sorted_bucket
