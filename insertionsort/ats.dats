staload "prelude/DATS/array.dats"

fun insertion_sort {n:nat} (arr: &(@[int][n]), n: int n): void = let
  fun inner (arr: &(@[int][n]), i: int, key: int, j: int): void =
    if j >= 0 && arr.[j] > key then (
      arr.[j+1] := arr.[j];
      inner (arr, i, key, j-1)
    ) else
      arr.[j+1] := key
  fun outer (arr: &(@[int][n]), i: int): void =
    if i < n then (
      inner (arr, i, arr.[i], i-1);
      outer (arr, i+1)
    )
in
  outer (arr, 1)
end
