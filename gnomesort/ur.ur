fun gnomeSort (arr : list int) : list int =
    let
        val a = Array.fromList arr
        val n = Array.length a
        fun loop i =
            if i >= n then ()
            else if i = 0 orelse Array.sub(a, i) >= Array.sub(a, i-1)
            then loop (i+1)
            else
                let val tmp = Array.sub(a, i) in
                    Array.update(a, i, Array.sub(a, i-1));
                    Array.update(a, i-1, tmp);
                    loop (i-1)
                end
    in
        loop 0;
        Array.toList a
    end
