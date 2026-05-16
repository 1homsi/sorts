let insertion_sort arr =
  let n = Array.length arr in
  for i = 1 to n - 1 do
    let key = arr.(i) in
    let j = ref (i - 1) in
    while !j >= 0 && arr.(!j) > key do
      arr.(!j + 1) <- arr.(!j);
      decr j
    done;
    arr.(!j + 1) <- key
  done

let bucket_sort arr =
  let n = Array.length arr in
  if n = 0 then arr
  else begin
    let mn = Array.fold_left min arr.(0) arr in
    let mx = Array.fold_left max arr.(0) arr in
    let buckets = Array.make n [] in
    Array.iter (fun x ->
      let idx = min (n - 1) (int_of_float ((x -. mn) /. (mx -. mn +. 1.0) *. float_of_int n)) in
      buckets.(idx) <- x :: buckets.(idx)
    ) arr;
    let result = Array.make n 0.0 in
    let pos = ref 0 in
    Array.iter (fun b ->
      let ba = Array.of_list b in
      insertion_sort ba;
      Array.iter (fun v -> result.(!pos) <- v; incr pos) ba
    ) buckets;
    result
  end

let () =
  let data = [| 0.78; 0.17; 0.39; 0.26; 0.72; 0.94; 0.21; 0.12; 0.23; 0.68 |] in
  let sorted = bucket_sort data in
  Array.iter (fun x -> Printf.printf "%.2f " x) sorted;
  print_newline ()
