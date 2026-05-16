def isSorted arr
    for i in [0 ... arr.length - 1]
        return false if arr[i] > arr[i + 1]
    return true

def shuffle arr
    let a = arr.slice(0)
    let n = a.length
    for i in [n - 1 .. 1]
        let j = Math.floor(Math.random() * (i + 1))
        let tmp = a[i]
        a[i] = a[j]
        a[j] = tmp
    return a

def bogosort arr
    let a = arr.slice(0)
    while !isSorted(a)
        a = shuffle(a)
    return a

let arr = [3, 1, 4, 1, 5, 9, 2, 6]
console.log(bogosort(arr))
