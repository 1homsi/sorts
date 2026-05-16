#include "share/atspre_staload.hats"

staload UN = "prelude/SATS/unsafe.sats"

fun insertion_sort {n:nat} (bucket: arrayref(double, n), sz: int n): void = let
    fun loop {i:nat | i <= n} .<n-i>. (i: int i): void =
        if i < sz then let
            val key = bucket[i]
            fun inner {j:int | 0 <= j} .<j+1>. (j: int j): void =
                if j >= 0 && bucket[j] > key then (
                    bucket[j+1] := bucket[j];
                    inner (j-1)
                ) else bucket[j+1] := key
        in inner (i-1); loop (i+1) end
in loop 1 end

fun bucket_sort {n:nat} (arr: arrayref(double, n), sz: int n): void =
    if sz > 0 then let
        var minV: double = arr[0]
        var maxV: double = arr[0]
        val () = for* {i:nat | i <= n} .<n-i>. (i: int i): void =>
            if i < sz then (
                if arr[i] < minV then minV := arr[i];
                if arr[i] > maxV then maxV := arr[i];
                $cont (i+1)
            )
        from 0
        val range = maxV - minV + 1.0
        implement main0 () = let
            val data = arrayref_make_elt<double> (i2sz 10, 0.0)
            val () = data[0] := 0.78; val () = data[1] := 0.17
            val () = data[2] := 0.39; val () = data[3] := 0.26
            val () = data[4] := 0.72; val () = data[5] := 0.94
            val () = data[6] := 0.21; val () = data[7] := 0.12
            val () = data[8] := 0.23; val () = data[9] := 0.68
        in
            bucket_sort (data, 10);
            for (var i: int = 0; i < 10; i := i + 1)
                print! (data[i], " ");
            print_newline ()
        end
    in () end
