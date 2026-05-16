fun insertSorted x [] = [x]
  | insertSorted x (h::t) = if x <= h then x::h::t else h::(insertSorted x t)

fun insertionSort [] = []
  | insertionSort (h::t) = insertSorted h (insertionSort t)

fun getIdx num mn mx n =
    let val raw = floor ((num - mn) / (mx - mn + 1.0) * real n)
    in Int.min (n - 1, raw) end

fun bucketSort [] = []
  | bucketSort arr =
    let val n = length arr
        val mn = foldl Real.min (hd arr) arr
        val mx = foldl Real.max (hd arr) arr
        val buckets = Array.array (n, [])
        val _ = List.app (fn num =>
            let val idx = getIdx num mn mx n
                val old = Array.sub (buckets, idx)
            in Array.update (buckets, idx, old @ [num]) end) arr
    in Array.foldl (fn (b, acc) => acc @ insertionSort b) [] buckets end

val data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
val sorted = bucketSort data
val _ = print (String.concatWith " " (map Real.toString sorted) ^ "\n")
