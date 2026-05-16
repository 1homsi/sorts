let flip arr k =
  let left = ref 0 and right = ref k in
  while !left < !right do
    let tmp = arr.(!left) in
    arr.(!left) <- arr.(!right);
    arr.(!right) <- tmp;
    incr left; decr right
  done

let pancake_sort arr =
  let n = Array.length arr in
  for size = n downto 2 do
    let max_idx = ref 0 in
    for i = 1 to size - 1 do
      if arr.(i) > arr.(!max_idx) then max_idx := i
    done;
    if !max_idx <> size - 1 then begin
      if !max_idx <> 0 then flip arr !max_idx;
      flip arr (size - 1)
    end
  done

let () =
  let arr = [| 3; 6; 2; 7; 4; 1; 5 |] in
  pancake_sort arr;
  Array.iter (fun x -> Printf.printf "%d " x) arr;
  print_newline ()
