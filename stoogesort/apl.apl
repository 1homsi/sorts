stoogeSort ← {
    arr first last ← ⍵
    arr ← ⍺
    :If (arr[first] > arr[last])
        arr[first last] ← arr[last first]
    :End
    n ← last - first + 1
    :If n > 2
        t ← ⌊n × 2 ÷ 3
        arr ← arr stoogeSort arr first (first+t-1)
        arr ← arr stoogeSort arr (last-t+1) last
        arr ← arr stoogeSort arr first (first+t-1)
    :End
    arr
}

arr ← 3 1 4 1 5 9 2 6
result ← arr stoogeSort arr 1 (⍴arr)
⎕ ← result
