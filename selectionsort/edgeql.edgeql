WITH
  arr := [5, 3, 1, 4, 2]
SELECT (
  FOR val IN array_unpack(arr)
  UNION val
)
ORDER BY .0;
