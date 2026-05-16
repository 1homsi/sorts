def shellSort(arr)
    let n = arr.length
    var gap = Math.floor(n / 2)
    while gap > 0
        for i in [gap...n]
            let temp = arr[i]
            var j = i
            while j >= gap and arr[j - gap] > temp
                arr[j] = arr[j - gap]
                j -= gap
            arr[j] = temp
        gap = Math.floor(gap / 2)
    arr

let arr = [64, 34, 25, 12, 22, 11, 90]
console.log shellSort(arr)
