let stooge_sort arr =
    let n = Array.length arr in
    let rec sort first last =
        if arr.(first) > arr.(last) then begin
            let tmp = arr.(first) in
            arr.(first) <- arr.(last);
            arr.(last) <- tmp
        end;
        if last - first + 1 > 2 then begin
            let t = (last - first + 1) * 2 / 3 in
            sort first (first + t - 1);
            sort (last - t + 1) last;
            sort first (first + t - 1)
        end
    in
    sort 0 (n - 1)

let () =
    let arr = [|3; 1; 4; 1; 5; 9; 2; 6|] in
    stooge_sort arr;
    Array.iter (fun x -> print_int x; print_char ' ') arr;
    print_newline ()
