fun isSorted (arr : list int) : bool =
    case arr of
        [] => True
      | [_] => True
      | x :: y :: rest => x <= y && isSorted (y :: rest)

fun shuffle (arr : list int) : transaction (list int) =
    return (List.sort (fn (a, b) => a <= b) arr)

fun bogosort (arr : list int) : transaction (list int) =
    if isSorted arr then
        return arr
    else
        shuffled <- shuffle arr;
        bogosort shuffled

fun main () : transaction page =
    sorted <- bogosort [3, 1, 4, 1, 5, 9, 2, 6];
    return <xml>
        <body>
            {[show sorted]}
        </body>
    </xml>
