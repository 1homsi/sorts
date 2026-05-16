fun getDigit x exp = (x div exp) mod 10

fun countingSort lst exp =
    let
        val buckets = List.tabulate(10, fn d =>
            List.filter (fn x => getDigit x exp = d) lst)
    in
        List.concat buckets
    end

fun radixSort [] = []
  | radixSort lst =
    let
        val maxVal = foldl Int.max 0 lst
        fun loop arr exp =
            if maxVal div exp = 0 then arr
            else loop (countingSort arr exp) (exp * 10)
    in
        loop lst 1
    end

val result = radixSort [170, 45, 75, 90, 802, 24, 2, 66]
val _ = print (String.concatWith " " (map Int.toString result) ^ "\n")
