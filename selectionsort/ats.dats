#include "share/atspre_staload.hats"

fun selection_sort{n:nat}(arr: array(int, n), n: int n): void =
  let
    fun loop{i:nat | i < n}(i: int i): void =
      if i < n - 1 then let
        var min_idx: int = i
        fun inner{j:nat | j <= n}(j: int j): void =
          if j < n then (
            if arr[j] < arr[min_idx] then min_idx := j;
            inner(j + 1)
          )
        val () = inner(i + 1)
        val tmp = arr[i]
      in
        arr[i] := arr[min_idx];
        arr[min_idx] := tmp;
        loop(i + 1)
      end
  in
    loop(0)
  end
