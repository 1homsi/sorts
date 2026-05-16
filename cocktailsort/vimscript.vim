function! CocktailSort(arr)
    let n = len(a:arr)
    let i = 0
    while i < n
        let swapped = 0
        let k = 0
        while k < n - i - 1
            if a:arr[k] > a:arr[k + 1]
                let temp = a:arr[k]
                let a:arr[k] = a:arr[k + 1]
                let a:arr[k + 1] = temp
                let swapped = 1
            endif
            let k += 1
        endwhile
        if !swapped
            break
        endif
        let i += 1
        let swapped = 0
        let k = n - i - 2
        while k >= 0
            if a:arr[k] > a:arr[k + 1]
                let temp = a:arr[k]
                let a:arr[k] = a:arr[k + 1]
                let a:arr[k + 1] = temp
                let swapped = 1
            endif
            let k -= 1
        endwhile
        if !swapped
            break
        endif
        let i += 1
    endwhile
    return a:arr
endfunction

let arr = [5, 2, 8, 1, 9, 3]
echo CocktailSort(arr)
