pH Bogosort

val arr = array [3, 1, 4, 1, 5, 9, 2, 6];
val n = 8;

fun isSorted a =
  let val sorted = ref true
  in
    for i from 0 to n-2 do
      if Array.sub(a, i) > Array.sub(a, i+1) then sorted := false
    done;
    !sorted
  end;

fun shuffle a =
  for i from n-1 downto 1 do
    let val j = Random.int (i+1)
        val tmp = Array.sub(a, i)
    in
      Array.update(a, i, Array.sub(a, j));
      Array.update(a, j, tmp)
    end
  done;

fun bogosort a =
  while not (isSorted a) do
    shuffle a
  done;

bogosort arr;
Array.app (fn x => print (Int.toString x ^ " ")) arr;
print "\n";
