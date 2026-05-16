let gnome_sort arr =
  let n = Array.length arr in
  let i = ref 0 in
  while !i < n do
    if !i = 0 || arr.(!i) >= arr.(!i - 1) then
      incr i
    else begin
      let tmp = arr.(!i) in
      arr.(!i) <- arr.(!i - 1);
      arr.(!i - 1) <- tmp;
      decr i
    end
  done;
  arr
