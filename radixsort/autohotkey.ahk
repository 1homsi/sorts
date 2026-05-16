arr := [170, 45, 75, 90, 802, 24, 2, 66]
n := arr.Length

maxVal := arr[1]
Loop n {
    if (arr[A_Index] > maxVal)
        maxVal := arr[A_Index]
}

exp := 1
While (maxVal // exp > 0) {
    Loop 10
        count%A_Index% := 0

    Loop n {
        idx := Mod(arr[A_Index] // exp, 10) + 1
        count%idx%++
    }

    Loop 9 {
        i := A_Index + 1
        count%i% += count%A_Index%
    }

    output := []
    Loop n
        output.Push(0)

    i := n
    While (i >= 1) {
        idx := Mod(arr[i] // exp, 10) + 1
        count%idx%--
        output[count%idx% + 1] := arr[i]
        i--
    }

    Loop n
        arr[A_Index] := output[A_Index]

    exp *= 10
}

result := ""
Loop n
    result .= arr[A_Index] . " "
MsgBox result
