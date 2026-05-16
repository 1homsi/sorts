with module default

function comb_sort(arr: array<int64>) -> array<int64>
using (
  select array_agg(
    (
      with
        n := len(arr),
        sorted := (select arr order by arr asc)
      select sorted
    )
  )
);
