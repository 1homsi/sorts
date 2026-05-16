#include "share/atspre_staload.hats"

fun stoogeSort {n:int} (arr: array(int, n), first: int, last: int): void =
    let
        val a = arr[first]
        val b = arr[last]
    in
        if a > b then begin
            arr[first] := b;
            arr[last] := a
        end;
        if last - first + 1 > 2 then
            let val t = (last - first + 1) * 2 / 3 in
                stoogeSort(arr, first, first + t - 1);
                stoogeSort(arr, last - t + 1, last);
                stoogeSort(arr, first, first + t - 1)
            end
    end

implement main0 () =
    let
        val arr = @[int](3, 1, 4, 1, 5, 9, 2, 6)
    in
        stoogeSort(arr, 0, 7);
        array_foreach(arr, lam(x) => print_int(x))
    end
