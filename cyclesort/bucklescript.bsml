let cycle_sort arr =
  let n = Array.length arr in
  let writes = ref 0 in
  for cycle_start = 0 to n - 2 do
    let item = ref arr.(cycle_start) in
    let pos = ref cycle_start in
    for i = cycle_start + 1 to n - 1 do
      if arr.(i) < !item then incr pos
    done;
    if !pos <> cycle_start then begin
      while !item = arr.(!pos) do incr pos done;
      let tmp = arr.(!pos) in
      arr.(!pos) <- !item;
      item := tmp;
      incr writes;
      while !pos <> cycle_start do
        pos := cycle_start;
        for i = cycle_start + 1 to n - 1 do
          if arr.(i) < !item then incr pos
        done;
        while !item = arr.(!pos) do incr pos done;
        let t = arr.(!pos) in
        arr.(!pos) <- !item;
        item := t;
        incr writes
      done
    end
  done;
  !writes

let () =
  let arr = [|5; 4; 3; 2; 1|] in
  let _ = cycle_sort arr in
  Array.iter (fun x -> print_int x; print_char ' ') arr;
  print_newline ()
