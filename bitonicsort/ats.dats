#include "share/atspre_staload.hats"

staload "libats/libc/SATS/stdio.sats"

fun compare_and_swap {n:int} (arr: array(int, n), i: natLt n, j: natLt n, dir: bool): void =
    let
        val ai = arr[i]
        val aj = arr[j]
    in
        if dir = (ai > aj) then begin
            arr[i] := aj;
            arr[j] := ai
        end
    end

fun bitonic_merge {n:int} (arr: array(int, n), lo: nat, cnt: nat, dir: bool): void =
    if cnt > 1 then let
        val k = cnt / 2
        var i: int = lo
        val () = while (i < lo + k) begin
            compare_and_swap(arr, i, i + k, dir);
            i := i + 1
        end
    in
        bitonic_merge(arr, lo, k, dir);
        bitonic_merge(arr, lo + k, k, dir)
    end

fun bitonic_sort {n:int} (arr: array(int, n), lo: nat, cnt: nat, dir: bool): void =
    if cnt > 1 then let
        val k = cnt / 2
    in
        bitonic_sort(arr, lo, k, true);
        bitonic_sort(arr, lo + k, k, false);
        bitonic_merge(arr, lo, cnt, dir)
    end

implement main0() =
    let
        val data = @[int][3, 7, 4, 8, 6, 2, 1, 5]
        val () = bitonic_sort(data, 0, 8, true)
        var i: int = 0
        val () = while (i < 8) begin
            printf("%d ", @(data[i]));
            i := i + 1
        end
        val () = printf("\n", @())
    in () end
