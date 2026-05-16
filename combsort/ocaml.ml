let comb_sort arr =
  let n = Array.length arr in
  let gap = ref n in
  let sorted = ref false in
  while not !sorted do
    gap := int_of_float (float_of_int !gap /. 1.3);
    if !gap <= 1 then begin
      gap := 1;
      sorted := true
    end;
    let i = ref 0 in
    while !i + !gap < n do
      if arr.(!i) > arr.(!i + !gap) then begin
        let tmp = arr.(!i) in
        arr.(!i) <- arr.(!i + !gap);
        arr.(!i + !gap) <- tmp;
        sorted := false
      end;
      incr i
    done
  done;
  arr
