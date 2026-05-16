fun compareAndSwap (arr: int array, i, j, direction: bool) =
    let val ai = Array.sub(arr, i)
        val aj = Array.sub(arr, j)
    in
        if direction = (ai > aj) then
            (Array.update(arr, i, aj); Array.update(arr, j, ai))
        else ()
    end

fun bitonicMerge (arr, lo, cnt, direction) =
    if cnt > 1 then
        let val k = cnt div 2
        in
            List.app (fn i => compareAndSwap(arr, i, i + k, direction))
                     (List.tabulate(k, fn n => lo + n));
            bitonicMerge(arr, lo, k, direction);
            bitonicMerge(arr, lo + k, k, direction)
        end
    else ()

fun bitonicSort (arr, lo, cnt, direction) =
    if cnt > 1 then
        let val k = cnt div 2
        in
            bitonicSort(arr, lo, k, true);
            bitonicSort(arr, lo + k, k, false);
            bitonicMerge(arr, lo, cnt, direction)
        end
    else ()

val data = Array.fromList [3, 7, 4, 8, 6, 2, 1, 5]
val () = bitonicSort(data, 0, Array.length data, true)
val () = Array.app (fn x => (print (Int.toString x); print " ")) data
val () = print "\n"
