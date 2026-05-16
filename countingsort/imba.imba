def counting_sort arr
    return arr if arr.length == 0
    let min = Math.min(...arr)
    let max = Math.max(...arr)
    let range = max - min + 1
    let count = Array.from({length: range}, -> 0)
    for v of arr
        count[v - min]++
    for let i = 1; i < range; i++
        count[i] += count[i - 1]
    let output = Array.from({length: arr.length}, -> 0)
    for let i = arr.length - 1; i >= 0; i--
        count[arr[i] - min]--
        output[count[arr[i] - min]] = arr[i]
    output

console.log counting_sort([4, 2, 2, 8, 3, 3, 1])
