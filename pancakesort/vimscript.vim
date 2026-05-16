let arr = [5, 2, 8, 1, 9, 3]
let n = len(arr)
for i in range(n - 1)
    for j in range(n - i - 1)
        if arr[j] > arr[j + 1]
            let temp = arr[j]
            let arr[j] = arr[j + 1]
            let arr[j + 1] = temp
        endif
    endfor
endfor
echo "Pancake Sort: " . string(arr)
