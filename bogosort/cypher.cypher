WITH [3, 1, 4, 1, 5, 9, 2, 6] AS arr
WITH arr,
     reduce(sorted = true, i IN range(0, size(arr)-2) |
       CASE WHEN arr[i] > arr[i+1] THEN false ELSE sorted END) AS isSorted
RETURN
  CASE WHEN isSorted THEN arr
  ELSE [x IN arr | x] END AS result
ORDER BY result
