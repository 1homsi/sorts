function BitonicSort(arr, lo, cnt, dir)
    if a:cnt > 1
        let k = a:cnt / 2
        call BitonicSort(a:arr, a:lo, k, 1)
        call BitonicSort(a:arr, a:lo + k, k, 0)
        call BitonicMerge(a:arr, a:lo, a:cnt, a:dir)
    endif
    return a:arr
endfunction

function BitonicMerge(arr, lo, cnt, dir)
    if a:cnt > 1
        let k = a:cnt / 2
        let i = a:lo
        while i < a:lo + a:cnt - k
            if (a:arr[i] > a:arr[i + k]) == (a:dir == 1)
                let tmp = a:arr[i]
                let a:arr[i] = a:arr[i + k]
                let a:arr[i + k] = tmp
            endif
            let i = i + 1
        endwhile
        call BitonicMerge(a:arr, a:lo, k, a:dir)
        call BitonicMerge(a:arr, a:lo + k, k, a:dir)
    endif
    return a:arr
endfunction

let arr = [5, 2, 8, 1, 9, 3, 7, 4]
call BitonicSort(arr, 0, len(arr), 1)
echo arr
