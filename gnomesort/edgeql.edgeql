WITH
    arr := [5, 3, 8, 1, 9, 2, 7, 4, 6, 0]
SELECT array_agg(
    (SELECT val FROM unnest(arr) AS val ORDER BY val)
);
