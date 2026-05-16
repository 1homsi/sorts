WITH
  MODULE default,
  arr := [3, 6, 2, 7, 4, 1, 5],
  n := len(arr)
SELECT (
  WITH sorted := (
    SELECT array_agg(
      (SELECT arr[idx] ORDER BY arr[idx])
    )
  )
  SELECT sorted
);
