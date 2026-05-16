def is_sorted(arr):
    for(length(arr) - 1) i:
        if arr[i] > arr[i + 1]:
            return false
    return true

def shuffle(arr):
    let n = length(arr)
    for(n) i:
        let j = rnd(n)
        swap(arr, i, j)

def bogosort(arr):
    let a = copy(arr)
    while not is_sorted(a):
        shuffle(a)
    return a

let arr = [3, 1, 4, 1, 5, 9, 2, 6]
print(bogosort(arr))
