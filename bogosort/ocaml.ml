let is_sorted arr =
    let rec check i = i >= Array.length arr - 1 || arr.(i) <= arr.(i+1) && check (i+1)
    in check 0

let bogosort arr =
    while not (is_sorted arr) do
        for i = Array.length arr - 1 downto 1 do
            let j = Random.int (i + 1) in
            let tmp = arr.(i) in arr.(i) <- arr.(j); arr.(j) <- tmp
        done
    done; arr
