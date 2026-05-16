with module default
select (
    with
        arr := [5, 3, 8, 1, 9, 2, 7, 4, 6, 0],
        sorted := array_agg(
            (select unnest(arr) order by unnest(arr))
        )
    select sorted
);
