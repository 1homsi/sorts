fun shellSort arr =
  let
    val a = Array.fromList arr
    val n = Array.length a
    fun shiftBack (gap, j, temp) =
      if j >= gap andalso Array.sub(a, j - gap) > temp
      then (Array.update(a, j, Array.sub(a, j - gap)); shiftBack(gap, j - gap, temp))
      else Array.update(a, j, temp)
    fun insertPass (gap, i) =
      if i >= n then ()
      else (shiftBack(gap, i, Array.sub(a, i)); insertPass(gap, i + 1))
    fun gapLoop 0 = ()
      | gapLoop gap = (insertPass(gap, gap); gapLoop(gap div 2))
  in
    gapLoop (n div 2);
    Array.toList a
  end

val result = shellSort [64, 34, 25, 12, 22, 11, 90]
val _ = List.app (fn x => print(Int.toString x ^ " ")) result
val _ = print "\n"
