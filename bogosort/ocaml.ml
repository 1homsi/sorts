let is_sorted arr =
  let n = Array.length arr in
  let rec check i =
    if i >= n - 1 then true
    else if arr.(i) > arr.(i + 1) then false
    else check (i + 1)
  in check 0

let shuffle arr =
  let a = Array.copy arr in
  let n = Array.length a in
  for i = n - 1 downto 1 do
    let j = Random.int (i + 1) in
    let tmp = a.(i) in
    a.(i) <- a.(j);
    a.(j) <- tmp
  done;
  a

let bogosort arr =
  let a = ref arr in
  while not (is_sorted !a) do
    a := shuffle !a
  done;
  !a

let () =
  Random.self_init ();
  let arr = [|3; 1; 4; 1; 5; 9; 2; 6|] in
  let sorted = bogosort arr in
  Array.iter (fun x -> Printf.printf "%d " x) sorted;
  print_newline ()
