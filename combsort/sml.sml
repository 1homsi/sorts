fun combSort arr =
  let
    val n = Array.length arr
    val gap = ref n
    val sorted = ref false
  in
    while not (!sorted) do (
      gap := Real.toInt IEEEReal.TO_ZERO (Real.fromInt (!gap) / 1.3);
      if !gap <= 1 then (gap := 1; sorted := true) else ();
      let
        val i = ref 0
      in
        while !i + !gap < n do (
          if Array.sub(arr, !i) > Array.sub(arr, !i + !gap) then (
            let val tmp = Array.sub(arr, !i)
            in
              Array.update(arr, !i, Array.sub(arr, !i + !gap));
              Array.update(arr, !i + !gap, tmp);
              sorted := false
            end
          ) else ();
          i := !i + 1
        )
      end
    );
    arr
  end
