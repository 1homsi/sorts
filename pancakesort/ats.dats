#include "share/atspre_staload.hats"

fun flip {n:int} (arr: arrayref(int, n), k: int): void =
  let
    fun go (left: int, right: int): void =
      if left < right then
        let
          val tmp = arr[left]
        in
          arr[left] := arr[right];
          arr[right] := tmp;
          go(left + 1, right - 1)
        end
  in go(0, k) end

fun find_max_idx {n:int} (arr: arrayref(int, n), size: int): int =
  let
    fun go (i: int, max_idx: int): int =
      if i >= size then max_idx
      else if arr[i] > arr[max_idx] then go(i + 1, i)
      else go(i + 1, max_idx)
  in go(1, 0) end

fun pancake_sort {n:int} (arr: arrayref(int, n), size: int): void =
  if size > 1 then
    let
      val max_idx = find_max_idx(arr, size)
    in
      if max_idx <> size - 1 then begin
        if max_idx <> 0 then flip(arr, max_idx);
        flip(arr, size - 1)
      end;
      pancake_sort(arr, size - 1)
    end

implement main0() =
  let
    val arr = arrayref_make_elt<int>(7, 0)
    val () = arr[0] := 3; val () = arr[1] := 6; val () = arr[2] := 2
    val () = arr[3] := 7; val () = arr[4] := 4; val () = arr[5] := 1
    val () = arr[6] := 5
    val () = pancake_sort(arr, 7)
  in
    arrayref_foreach(arr, lam(x) => print(x); print(" "));
    print_newline()
  end
