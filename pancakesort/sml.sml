fun flip (arr: int array) (k: int) : unit =
  let
    fun go left right =
      if left < right then (
        let val tmp = Array.sub(arr, left)
        in Array.update(arr, left, Array.sub(arr, right));
           Array.update(arr, right, tmp);
           go (left + 1) (right - 1)
        end
      ) else ()
  in go 0 k end

fun findMaxIdx (arr: int array) (size: int) : int =
  let
    fun go i maxIdx =
      if i >= size then maxIdx
      else if Array.sub(arr, i) > Array.sub(arr, maxIdx)
           then go (i + 1) i
           else go (i + 1) maxIdx
  in go 1 0 end

fun pancakeSort (arr: int array) : unit =
  let
    fun go size =
      if size <= 1 then ()
      else
        let val maxIdx = findMaxIdx arr size
        in
          if maxIdx <> size - 1 then (
            if maxIdx <> 0 then flip arr maxIdx else ();
            flip arr (size - 1)
          ) else ();
          go (size - 1)
        end
  in go (Array.length arr) end

val arr = Array.fromList [3, 6, 2, 7, 4, 1, 5]
val () = pancakeSort arr
val () = print (String.concatWith " " (map Int.toString (Array.toList arr)) ^ "\n")
