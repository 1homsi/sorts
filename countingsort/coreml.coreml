let counting_sort arr =
  let n = Array.length arr in
  if n = 0 then arr
  else begin
    let max_val = Array.fold_left max arr.(0) arr in
    let min_val = Array.fold_left min arr.(0) arr in
    let range = max_val - min_val + 1 in
    let count = Array.make range 0 in
    Array.iter (fun v -> count.(v - min_val) <- count.(v - min_val) + 1) arr;
    for i = 1 to range - 1 do count.(i) <- count.(i) + count.(i - 1) done;
    let output = Array.make n 0 in
    for i = n - 1 downto 0 do
      count.(arr.(i) - min_val) <- count.(arr.(i) - min_val) - 1;
      output.(count.(arr.(i) - min_val)) <- arr.(i)
    done; output
  end
let () =
  let r = counting_sort [|4; 2; 2; 8; 3; 3; 1|] in
  Array.iter (fun v -> Printf.printf "%d " v) r; print_newline ()
