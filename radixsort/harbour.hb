function CountingSort(arr, exp)
    local n := Len(arr)
    local output := Array(n)
    local cnt := Array(10)
    local i, idx
    AFill(cnt, 0)
    for i := 1 to n
        idx := Int(arr[i] / exp) % 10 + 1
        cnt[idx]++
    next
    for i := 2 to 10
        cnt[i] += cnt[i - 1]
    next
    for i := n to 1 step -1
        idx := Int(arr[i] / exp) % 10 + 1
        output[cnt[idx]] := arr[i]
        cnt[idx]--
    next
    for i := 1 to n
        arr[i] := output[i]
    next
    return arr

function RadixSort(arr)
    local maxVal := arr[1]
    local exp := 1
    local i
    for i := 2 to Len(arr)
        if arr[i] > maxVal
            maxVal := arr[i]
        endif
    next
    while Int(maxVal / exp) > 0
        arr := CountingSort(arr, exp)
        exp *= 10
    enddo
    return arr

procedure Main()
    local arr := {170, 45, 75, 90, 802, 24, 2, 66}
    arr := RadixSort(arr)
    AEval(arr, {|x| QOut(Str(x))})
