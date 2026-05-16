#include "share/atspre_staload.hats"

fn partition {n:int} (arr: arrayref(int, n), low: int, high: int): int =
let
    val pivot = arr[high]
    var i: int = low
    var j: int = low
in
    while (j < high) begin
        if arr[j] <= pivot then begin
            val tmp = arr[i]
            arr[i] := arr[j]
            arr[j] := tmp;
            i := i + 1
        end;
        j := j + 1
    end;
    val tmp = arr[i]
    arr[i] := arr[high]
    arr[high] := tmp;
    i
end

fn quicksort {n:int} (arr: arrayref(int, n), low: int, high: int): void =
    if low < high then let
        val p = partition(arr, low, high)
    in
        quicksort(arr, low, p - 1);
        quicksort(arr, p + 1, high)
    end

implement main0 () =
let
    val arr = arrayref_make_elt<int>(7, 0)
    val () = arr[0] := 3; val () = arr[1] := 6
    val () = arr[2] := 8; val () = arr[3] := 10
    val () = arr[4] := 1; val () = arr[5] := 2
    val () = arr[6] := 1
in
    quicksort(arr, 0, 6);
    arrayref_foreach_cloref<int>(arr, 7, lam x => print! (x, " "));
    print_newline()
end
