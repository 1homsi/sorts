let counting_sort arr exp =
  let n = Array.length arr in
  let output = Array.make n 0 in
  let count = Array.make 10 0 in
  Array.iter (fun x -> count.((x / exp) mod 10) <- count.((x / exp) mod 10) + 1) arr;
  for i = 1 to 9 do count.(i) <- count.(i) + count.(i-1) done;
  for i = n - 1 downto 0 do
    let idx = (arr.(i) / exp) mod 10 in
    count.(idx) <- count.(idx) - 1;
    output.(count.(idx)) <- arr.(i)
  done;
  Array.blit output 0 arr 0 n

let radix_sort arr =
  if Array.length arr = 0 then ()
  else begin
    let max = Array.fold_left max arr.(0) arr in
    let exp = ref 1 in
    while max / !exp > 0 do
      counting_sort arr !exp;
      exp := !exp * 10
    done
  end

let () =
  let arr = [|170; 45; 75; 90; 802; 24; 2; 66|] in
  radix_sort arr;
  Array.iter (fun x -> print_int x; print_char ' ') arr;
  print_newline ()
