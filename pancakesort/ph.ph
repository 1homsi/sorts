def flip arr k =
    let rec go a l r =
        if l >= r then a
        else
            let tmp = a.(l)
            let a1 = Array.set a l a.(r)
            let a2 = Array.set a1 r tmp
            go a2 (l+1) (r-1)
    go arr 0 k

def find_max_idx arr size =
    let rec go mi i =
        if i >= size then mi
        else if arr.(i) > arr.(mi) then go i (i+1)
        else go mi (i+1)
    go 0 1

def rec pancake_sort arr size =
    if size <= 1 then arr
    else
        let mi = find_max_idx arr size
        let a1 = if mi <> 0 then flip arr mi else arr
        let a2 = flip a1 (size-1)
        pancake_sort a2 (size-1)

let () =
    let arr = [|3; 6; 2; 7; 4; 1; 5|]
    let sorted = pancake_sort arr 7
    Array.iter (fun x -> Printf.printf "%d " x) sorted
