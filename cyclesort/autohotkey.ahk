arr := [5, 4, 3, 2, 1]
n := arr.Length()
writes := 0

Loop, % n - 1
{
    cycleStart := A_Index
    item := arr[cycleStart]
    pos := cycleStart
    Loop, % n - cycleStart
    {
        i := cycleStart + A_Index
        if (arr[i] < item)
            pos++
    }
    if (pos = cycleStart)
        continue
    while (item = arr[pos])
        pos++
    tmp := arr[pos]
    arr[pos] := item
    item := tmp
    writes++
    while (pos != cycleStart)
    {
        pos := cycleStart
        Loop, % n - cycleStart
        {
            i := cycleStart + A_Index
            if (arr[i] < item)
                pos++
        }
        while (item = arr[pos])
            pos++
        tmp := arr[pos]
        arr[pos] := item
        item := tmp
        writes++
    }
}

result := ""
Loop, % n
    result .= arr[A_Index] " "
MsgBox, % result
