let shell_sort arr =
  let n = Array.length arr in
  let gap = ref (n / 2) in
  while !gap > 0 do
    for i = !gap to n - 1 do
      let temp = arr.(i) in
      let j = ref i in
      while !j >= !gap && arr.(!j - !gap) > temp do
        arr.(!j) <- arr.(!j - !gap);
        j := !j - !gap
      done;
      arr.(!j) <- temp
    done;
    gap := !gap / 2
  done;
  arr

let () =
  let arr = [| 64; 34; 25; 12; 22; 11; 90 |] in
  let sorted = shell_sort arr in
  Array.iter (fun x -> print_int x; print_char ' ') sorted;
  print_newline ()
