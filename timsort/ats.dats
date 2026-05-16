#include "share/atspre_staload.hats"

val MIN_RUN = 32

fun insertion_sort {n:int} (arr: array(int, n), left: int, right: int): void = let
    fun loop (i: int): void =
        if i > right then ()
        else let
            val key = arr[i]
            fun inner (j: int): int =
                if j < left || arr[j] <= key then j
                else (arr[j+1] := arr[j]; inner(j-1))
            val j = inner(i-1)
        in arr[j+1] := key; loop(i+1) end
in loop(left+1) end

fun merge {n:int} (arr: array(int, n), left: int, mid: int, right: int): void = let
    val ln = mid - left + 1
    val rn = right - mid
    val lp = array_make_elt<int>(ln, 0)
    val rp = array_make_elt<int>(rn, 0)
    val () = for* (i: int | i >= 0) => (i := 0; i < ln; i := i+1) do lp[i] := arr[left+i]
    val () = for* (i: int | i >= 0) => (i := 0; i < rn; i := i+1) do rp[i] := arr[mid+1+i]
    fun loop (i: int, j: int, k: int): void =
        if i >= ln && j >= rn then ()
        else if i >= ln then (arr[k] := rp[j]; loop(i, j+1, k+1))
        else if j >= rn then (arr[k] := lp[i]; loop(i+1, j, k+1))
        else if lp[i] <= rp[j] then (arr[k] := lp[i]; loop(i+1, j, k+1))
        else (arr[k] := rp[j]; loop(i, j+1, k+1))
in loop(0, 0, left) end

fun timsort {n:int} (arr: array(int, n), n: int): void = let
    fun run_loop (i: int): void =
        if i >= n then ()
        else let val right = min(i+MIN_RUN-1, n-1) in
            insertion_sort(arr, i, right); run_loop(i+MIN_RUN)
        end
    fun size_loop (sz: int): void =
        if sz >= n then ()
        else let
            fun left_loop (left: int): void =
                if left >= n then ()
                else let
                    val mid = min(left+sz-1, n-1)
                    val right = min(left+2*sz-1, n-1)
                    val () = if mid < right then merge(arr, left, mid, right)
                in left_loop(left + 2*sz) end
        in left_loop(0); size_loop(sz*2) end
in run_loop(0); size_loop(MIN_RUN) end

implement main0() = {
    val arr = $arrpsz(5, 2, 8, 1, 9, 3, 7, 4, 6)
    val () = timsort(arr, 9)
    val () = for* (i: int | i >= 0) => (i := 0; i < 9; i := i+1) do print!(arr[i], " ")
    val () = println!()
}
