#include "share/atspre_staload.hats"

fun cycle_sort {n:nat} (arr: arrayref(int, n), n: int n): int = let
  var writes: int = 0
  var cycle_start: int = 0
in
  while (cycle_start < n - 1) let
    var item: int = arr[cycle_start]
    var pos: int = cycle_start
    var i: int = cycle_start + 1
  in
    while (i < n)
      (if arr[i] < item then pos := pos + 1; i := i + 1);
    if pos != cycle_start then let
      val () = while (item = arr[pos]) (pos := pos + 1)
      val tmp = arr[pos]
      val () = arr[pos] := item
      var item: int = tmp
      val () = writes := writes + 1
    in
      while (pos != cycle_start) let
        val () = pos := cycle_start
        var i: int = cycle_start + 1
        val () = while (i < n)
          (if arr[i] < item then pos := pos + 1; i := i + 1)
        val () = while (item = arr[pos]) (pos := pos + 1)
        val t = arr[pos]
        val () = arr[pos] := item
        val () = item := t
        val () = writes := writes + 1
      in () end
    end;
    cycle_start := cycle_start + 1
  end;
  writes
end

implement main0 () = {
  val arr = arrayref_make_listlen<int> (list_make_elt (5, _), 5)
  val () = arr[0] := 5; arr[1] := 4; arr[2] := 3; arr[3] := 2; arr[4] := 1
  val _ = cycle_sort (arr, 5)
  val () = arrayref_foreach (arr, lam (x) => print! (x, " "))
  val () = print_newline ()
}
