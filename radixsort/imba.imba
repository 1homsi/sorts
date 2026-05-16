def countingSort arr, exp
    let n = arr.length
    let output = Array.new(n).fill(0)
    let count = Array.new(10).fill(0)
    for x in arr
        count[Math.floor(x / exp) % 10]++
    for i in [1...10]
        count[i] += count[i - 1]
    let i = n - 1
    while i >= 0
        let idx = Math.floor(arr[i] / exp) % 10
        count[idx]--
        output[count[idx]] = arr[i]
        i--
    for i in [0...n]
        arr[i] = output[i]

def radixSort arr
    return arr unless arr.length
    let max = Math.max(...arr)
    let exp = 1
    while Math.floor(max / exp) > 0
        countingSort(arr, exp)
        exp *= 10
    arr

let arr = [170, 45, 75, 90, 802, 24, 2, 66]
console.log radixSort(arr)
