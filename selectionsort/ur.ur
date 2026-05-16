fun selectionSort (arr : list int) : list int =
    let fun removeFirst x [] = []
          | removeFirst x (y :: ys) = if x = y then ys else y :: removeFirst x ys
        fun loop [] = []
          | loop xs =
            let val m = foldl (fn (a, b) => if a < b then a else b) (hd xs) xs
            in m :: loop (removeFirst m xs) end
    in loop arr end
