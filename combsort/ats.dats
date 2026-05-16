#include "share/atspre_staload.hats"

implement main0 () = ()

fun combSort {n:nat} (arr: array(int, n), n: int n): void =
    let
        var gap: int = n
        var sorted: bool = false
    in
        while (~sorted)
        (
            gap := g0float2int(g0int2float_int_double(gap) / 1.3);
            if gap <= 1 then (gap := 1; sorted := true);
            let var i: int = 0 in
                while (i + gap < n)
                (
                    if arr[i] > arr[i+gap] then
                    (
                        let val tmp = arr[i] in
                            arr[i] := arr[i+gap];
                            arr[i+gap] := tmp;
                            sorted := false
                        end
                    );
                    i := i + 1
                )
            end
        )
    end
