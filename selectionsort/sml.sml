fun selectionSort lst =
  let
    fun removeFirst _ [] = []
      | removeFirst x (y::ys) = if x = y then ys else y :: removeFirst x ys
    fun minList [] = raise Empty
      | minList [x] = x
      | minList (x::xs) = let val m = minList xs in if x < m then x else m end
  in
    case lst of
      [] => []
    | _ =>
        let val m = minList lst
        in m :: selectionSort (removeFirst m lst)
        end
  end
