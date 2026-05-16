val minRun = 32

fun insertVal x [] = [x]
  | insertVal x (h::t) = if x <= h then x::h::t else h::(insertVal x t)

fun insertionSort [] = []
  | insertionSort (h::t) = insertVal h (insertionSort t)

fun mergeRuns [] ys = ys
  | mergeRuns xs [] = xs
  | mergeRuns (x::xs) (y::ys) =
      if x <= y then x :: mergeRuns xs (y::ys)
      else y :: mergeRuns (x::xs) ys

fun chunksOf _ [] = []
  | chunksOf n xs =
      let val (chunk, rest) = (List.take(xs, Int.min(n, length xs)),
                                List.drop(xs, Int.min(n, length xs)))
      in chunk :: chunksOf n rest end

fun mergePairs [] = []
  | mergePairs [x] = [x]
  | mergePairs (x::y::rest) = mergeRuns x y :: mergePairs rest

fun mergeAll [x] = x
  | mergeAll xs = mergeAll (mergePairs xs)

fun timsort [] = []
  | timsort xs =
      let val chunks = chunksOf minRun xs
          val sorted = map insertionSort chunks
      in mergeAll sorted end

val result = timsort [5, 2, 8, 1, 9, 3, 7, 4, 6]
val _ = print (String.concatWith " " (map Int.toString result) ^ "\n")
