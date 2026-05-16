function Heapsort(arr)
    let n = len(a:arr)
    for i in range(n / 2 - 1, -1, -1)
        call Siftdown(a:arr, i, n)
    endfor
    for i in range(n - 1, 0, -1)
        let temp = a:arr[0]
        let a:arr[0] = a:arr[i]
        let a:arr[i] = temp
        call Siftdown(a:arr, 0, i)
    endfor
endfunction

function Siftdown(arr, i, n)
    let largest = a:i
    let left = 2 * a:i + 1
    let right = 2 * a:i + 2
    if left < a:n && a:arr[left] > a:arr[largest]
        let largest = left
    endif
    if right < a:n && a:arr[right] > a:arr[largest]
        let largest = right
    endif
    if largest != a:i
        let temp = a:arr[a:i]
        let a:arr[a:i] = a:arr[largest]
        let a:arr[largest] = temp
        call Siftdown(a:arr, largest, a:n)
    endif
endfunction

let arr = [5, 2, 8, 1, 9, 3]
call Heapsort(arr)
echo arr
