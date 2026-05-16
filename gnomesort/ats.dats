implement main0 () = ()

fun gnome_sort {n:nat} (arr: arrayref(int, n), n: int n): void =
    let
        var i: int = 0
        val _ = while (i < n) (
            if i = 0 orelse arr[i] >= arr[i-1]
            then i := i + 1
            else let
                val tmp = arr[i]
                val () = arr[i] := arr[i-1]
                val () = arr[i-1] := tmp
            in i := i - 1 end
        )
    in () end
