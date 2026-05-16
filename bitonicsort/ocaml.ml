let compare_and_swap arr i j direction =
  if direction = (arr.(i) > arr.(j)) then begin
    let tmp = arr.(i) in
    arr.(i) <- arr.(j);
    arr.(j) <- tmp
  end

let rec bitonic_merge arr lo cnt direction =
  if cnt > 1 then begin
    let k = cnt / 2 in
    for i = lo to lo + k - 1 do
      compare_and_swap arr i (i + k) direction
    done;
    bitonic_merge arr lo k direction;
    bitonic_merge arr (lo + k) k direction
  end

let rec bitonic_sort arr lo cnt direction =
  if cnt > 1 then begin
    let k = cnt / 2 in
    bitonic_sort arr lo k true;
    bitonic_sort arr (lo + k) k false;
    bitonic_merge arr lo cnt direction
  end

let () =
  let data = [| 3; 7; 4; 8; 6; 2; 1; 5 |] in
  bitonic_sort data 0 (Array.length data) true;
  Array.iter (fun x -> print_int x; print_char ' ') data;
  print_newline ()
