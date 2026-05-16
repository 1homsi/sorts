let cocktail_sort = fun arr =>
  let n = std.array.length arr in
  let rec go = fun arr start end_ swapped =>
    if not swapped then arr
    else
      let rec fwd = fun arr i sw =>
        if i >= end_ then { arr, sw }
        else
          let a = std.array.at i arr in
          let b = std.array.at (i + 1) arr in
          if a > b then
            fwd (std.array.generate (fun k =>
              if k == i then b
              else if k == (i + 1) then a
              else std.array.at k arr) n) (i + 1) true
          else fwd arr (i + 1) sw
      in
      let { arr = arr1, sw = sw1 } = fwd arr start false in
      if not sw1 then arr1
      else
        let rec bwd = fun arr i sw =>
          if i < start then { arr, sw }
          else
            let a = std.array.at i arr in
            let b = std.array.at (i + 1) arr in
            if a > b then
              bwd (std.array.generate (fun k =>
                if k == i then b
                else if k == (i + 1) then a
                else std.array.at k arr) n) (i - 1) true
            else bwd arr (i - 1) sw
        in
        let { arr = arr2, sw = sw2 } = bwd arr1 (end_ - 1) false in
        go arr2 (start + 1) (end_ - 1) sw2
  in
  go arr 0 (n - 1) true
in
cocktail_sort [5, 3, 8, 1, 9, 2, 7, 4, 6, 0]
