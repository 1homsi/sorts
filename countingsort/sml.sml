fun countingSort arr =
  let
    val n = length arr
    val minVal = foldl Int.min (hd arr) arr
    val maxVal = foldl Int.max (hd arr) arr
    val range = maxVal - minVal + 1
    val count = Array.array(range, 0)
    val _ = app (fn v => Array.update(count, v - minVal, Array.sub(count, v - minVal) + 1)) arr
    val _ = Array.appi (fn (i, _) =>
      if i > 0 then Array.update(count, i, Array.sub(count, i) + Array.sub(count, i - 1))
      else ()) count
    val output = Array.array(n, 0)
    val _ = foldr (fn (v, _) =>
      let
        val idx = v - minVal
        val pos = Array.sub(count, idx) - 1
      in
        Array.update(count, idx, pos);
        Array.update(output, pos, v)
      end) () arr
  in
    Array.foldr (op ::) [] output
  end;

val result = countingSort [4, 2, 2, 8, 3, 3, 1];
app (fn v => (print (Int.toString v); print " ")) result;
print "
";
