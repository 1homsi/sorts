WITH
  arr := [5, 4, 3, 2, 1],
  sorted := (
    FOR val IN {array_unpack(arr)}
    UNION (
      SELECT {
        pos := count((SELECT array_unpack(arr) FILTER array_unpack(arr) < val)),
        val := val
      }
    )
  )
SELECT sorted ORDER BY .pos;
