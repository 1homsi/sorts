arr = "5 3 1 4 2"
n = words(arr)
do i = 1 to n - 1
    minIdx = i
    do j = i + 1 to n
        if word(arr, j) < word(arr, minIdx) then minIdx = j
    end
    tmp = word(arr, i)
    arr = subword(arr, 1, i-1) word(arr, minIdx) subword(arr, i+1, minIdx-i-1) tmp subword(arr, minIdx+1)
end
say arr
