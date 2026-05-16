fun bubblePass [] = ([], false)
  | bubblePass [x] = ([x], false)
  | bubblePass (x::y::rest) =
    if x > y then
      let val (sorted, _) = bubblePass (x::rest)
      in (y::sorted, true) end
    else
      let val (sorted, sw) = bubblePass (y::rest)
      in (x::sorted, sw) end

fun bubbleSort lst =
  let val (sorted, swapped) = bubblePass lst
  in if swapped then bubbleSort sorted else sorted end

val arr = [64, 34, 25, 12, 22, 11, 90]
val sorted = bubbleSort arr
val _ = app (fn x => print (Int.toString x ^ " ")) sorted
val _ = print "\n"
