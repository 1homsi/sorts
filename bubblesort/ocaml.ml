let bubble_sort arr =
  let n = Array.length arr in
  let swapped = ref true in
  let limit = ref n in
  while !swapped do
    swapped := false;
    for i = 0 to !limit - 2 do
      if arr.(i) > arr.(i + 1) then begin
        let tmp = arr.(i) in
        arr.(i) <- arr.(i + 1);
        arr.(i + 1) <- tmp;
        swapped := true
      end
    done;
    decr limit
  done

let () =
  let arr = [| 64; 34; 25; 12; 22; 11; 90 |] in
  bubble_sort arr;
  Array.iter (fun x -> print_int x; print_char ' ') arr;
  print_newline ()
