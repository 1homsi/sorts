let min_run = 32

let insertion_sort arr left right =
  for i = left + 1 to right do
    let key = arr.(i) in
    let j = ref (i - 1) in
    while !j >= left && arr.(!j) > key do
      arr.(!j + 1) <- arr.(!j);
      j := !j - 1
    done;
    arr.(!j + 1) <- key
  done

let merge arr left mid right =
  let ln = mid - left + 1 in
  let rn = right - mid in
  let lp = Array.sub arr left ln in
  let rp = Array.sub arr (mid + 1) rn in
  let i = ref 0 and j = ref 0 and k = ref left in
  while !i < ln && !j < rn do
    if lp.(!i) <= rp.(!j) then begin
      arr.(!k) <- lp.(!i); incr i
    end else begin
      arr.(!k) <- rp.(!j); incr j
    end;
    incr k
  done;
  while !i < ln do arr.(!k) <- lp.(!i); incr i; incr k done;
  while !j < rn do arr.(!k) <- rp.(!j); incr j; incr k done

let timsort arr =
  let n = Array.length arr in
  let i = ref 0 in
  while !i < n do
    insertion_sort arr !i (min (!i + min_run - 1) (n - 1));
    i := !i + min_run
  done;
  let size = ref min_run in
  while !size < n do
    let left = ref 0 in
    while !left < n do
      let mid = min (!left + !size - 1) (n - 1) in
      let right = min (!left + 2 * !size - 1) (n - 1) in
      if mid < right then merge arr !left mid right;
      left := !left + 2 * !size
    done;
    size := !size * 2
  done

let () =
  let arr = [|5; 2; 8; 1; 9; 3; 7; 4; 6|] in
  timsort arr;
  Array.iter (fun x -> print_int x; print_char ' ') arr;
  print_newline ()
