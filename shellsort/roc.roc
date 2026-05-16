app "shell-sort" packages {} imports [] provides [main] to platform

shellSort : List I64 -> List I64
shellSort lst =
    n = List.len lst
    arr = List.walk lst (List.withCapacity n) List.append
    sortWithGap arr n (n // 2)

sortWithGap : List I64, U64, U64 -> List I64
sortWithGap arr n gap =
    if gap <= 0 then
        arr
    else
        arr2 = List.walk (List.range gap n) arr (\a, i ->
            insertionStep a gap i
        )
        sortWithGap arr2 n (gap // 2)

insertionStep : List I64, U64, U64 -> List I64
insertionStep arr gap i =
    temp = List.get arr i |> Result.withDefault 0
    shiftBack arr gap i temp

shiftBack : List I64, U64, U64, I64 -> List I64
shiftBack arr gap j temp =
    prev = List.get arr (j - gap) |> Result.withDefault 0
    if j >= gap && prev > temp then
        arr2 = List.set arr j prev
        shiftBack arr2 gap (j - gap) temp
    else
        List.set arr j temp

main = shellSort [64, 34, 25, 12, 22, 11, 90]
