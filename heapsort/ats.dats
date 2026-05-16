#include "share/atspre_staload.hats"

fn heapify(arr: arrayptr(int, 6), n: int, i: int): void = let
  val largest = ref<int>(i)
  val left = 2 * i + 1
  val right = 2 * i + 2
  val _ = if left < n && arr[left] > arr[!largest] then !largest := left
  val _ = if right < n && arr[right] > arr[!largest] then !largest := right
in
  if !largest <> i then let
    val tmp = arr[i]
    val _ = arr[i] := arr[!largest]
    val _ = arr[!largest] := tmp
  in heapify(arr, n, !largest) end
end

fn heapsort(arr: arrayptr(int, 6)): void = let
  val n = 6
  fun build_loop(i: int): void =
    if i >= 0 then (heapify(arr, n, i); build_loop(i - 1))
  val _ = build_loop(n / 2 - 1)
  fun sort_loop(i: int): void =
    if i > 0 then let
      val tmp = arr[0]
      val _ = arr[0] := arr[i]
      val _ = arr[i] := tmp
      val _ = heapify(arr, i, 0)
    in sort_loop(i - 1) end
  val _ = sort_loop(n - 1)
in () end

implement main0() = let
  val arr = arrayptr_make_elt<int>(i2sz(6), 0)
  val _ = arr[0] := 12; val _ = arr[1] := 11; val _ = arr[2] := 13
  val _ = arr[3] := 5; val _ = arr[4] := 6; val _ = arr[5] := 7
  val _ = heapsort(arr)
in
  println!(arr[0], " ", arr[1], " ", arr[2], " ", arr[3], " ", arr[4], " ", arr[5])
end
