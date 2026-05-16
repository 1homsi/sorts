WITH
  arr := [3, 1, 4, 1, 5, 9, 2, 6],
  sorted := (SELECT x := array_unpack(arr) ORDER BY x)
SELECT array_agg(sorted);
