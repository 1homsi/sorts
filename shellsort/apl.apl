ShellSort←{
    arr←⍵
    n←≢arr
    gap←⌊n÷2
    :While gap>0
        :For i :In gap+⍳n-gap
            temp←arr[i]
            j←i
            :While (j≥gap)∧(arr[j-gap]>temp)
                arr[j]←arr[j-gap]
                j←j-gap
            :EndWhile
            arr[j]←temp
        :EndFor
        gap←⌊gap÷2
    :EndWhile
    arr
}

⎕←ShellSort 64 34 25 12 22 11 90
