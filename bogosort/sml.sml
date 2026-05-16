fun isSorted [] = true
  | isSorted [_] = true
  | isSorted (x::y::rest) = x <= y andalso isSorted (y::rest)

fun shuffle lst =
  let
    val arr = Array.fromList lst
    val n = Array.length arr
    fun swap i j =
      let val tmp = Array.sub(arr, i)
      in Array.update(arr, i, Array.sub(arr, j));
         Array.update(arr, j, tmp)
      end
    fun loop 0 = ()
      | loop i = (swap i (Random.randRange (0, i) (Random.newgen ())); loop (i - 1))
  in
    loop (n - 1);
    Array.foldr (op ::) [] arr
  end

fun bogosort lst =
  if isSorted lst then lst
  else bogosort (shuffle lst)

val arr = [3, 1, 4, 1, 5, 9, 2, 6]
val sorted = bogosort arr
val _ = print (String.concatWith " " (map Int.toString sorted) ^ "\n")
