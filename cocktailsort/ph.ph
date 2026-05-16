val cocktailSort : int array -> int array =
  fun arr =>
    let val n = Array.length arr
        fun swap(i, j) =
          let val tmp = arr sub i
          in  upd(arr, i, arr sub j);
              upd(arr, j, tmp)
          end
        fun fwd(i, e, sw) =
          if i >= e then sw
          else if arr sub i > arr sub (i+1)
               then (swap(i, i+1); fwd(i+1, e, true))
               else fwd(i+1, e, sw)
        fun bwd(i, s, sw) =
          if i < s then sw
          else if arr sub i > arr sub (i+1)
               then (swap(i, i+1); bwd(i-1, s, true))
               else bwd(i-1, s, sw)
        fun loop(s, e) =
          if s >= e then ()
          else let val sw1 = fwd(s, e, false)
               in if not sw1 then ()
                  else let val sw2 = bwd(e-1, s, false)
                       in if sw2 then loop(s+1, e-1) else ()
                  end
          end
    in  loop(0, n-1); arr
    end
