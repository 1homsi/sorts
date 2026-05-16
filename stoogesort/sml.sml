fun stoogeSort arr first last =
    let
        val a = Array.sub(arr, first)
        val b = Array.sub(arr, last)
        val _ = if a > b then (Array.update(arr, first, b); Array.update(arr, last, a)) else ()
        val n = last - first + 1
    in
        if n > 2 then
            let
                val t = n * 2 div 3
            in
                stoogeSort arr first (first + t - 1);
                stoogeSort arr (last - t + 1) last;
                stoogeSort arr first (first + t - 1)
            end
        else ()
    end

val arr = Array.fromList [3, 1, 4, 1, 5, 9, 2, 6]
val _ = stoogeSort arr 0 (Array.length arr - 1)
val _ = Array.app (fn x => print (Int.toString x ^ " ")) arr
val _ = print "\n"
