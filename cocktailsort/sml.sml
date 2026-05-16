fun cocktailSort arr =
  let
    val n = Array.length arr
    val swapped = ref true
    val start = ref 0
    val ending = ref (n - 1)
    fun swap i j =
      let val tmp = Array.sub(arr, i)
      in Array.update(arr, i, Array.sub(arr, j));
         Array.update(arr, j, tmp)
      end
    fun fwd i =
      if i >= !ending then ()
      else (if Array.sub(arr, i) > Array.sub(arr, i+1)
            then (swap i (i+1); swapped := true)
            else ();
            fwd (i+1))
    fun bwd i =
      if i < !start then ()
      else (if Array.sub(arr, i) > Array.sub(arr, i+1)
            then (swap i (i+1); swapped := true)
            else ();
            bwd (i-1))
  in
    while !swapped do
      (swapped := false;
       fwd !start;
       if !swapped then
         (swapped := false;
          ending := !ending - 1;
          bwd (!ending - 1);
          start := !start + 1)
       else ());
    arr
  end
