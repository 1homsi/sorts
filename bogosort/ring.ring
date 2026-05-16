arr = [3, 1, 4, 1, 5, 9, 2, 6]
n = len(arr)

func isSorted(a)
    for i = 1 to len(a) - 1
        if a[i] > a[i + 1]
            return false
        ok
    next
    return true

func shuffle(a)
    n = len(a)
    for i = n to 2 step -1
        j = random(i - 1) + 1
        tmp = a[i]
        a[i] = a[j]
        a[j] = tmp
    next
    return a

while not isSorted(arr)
    arr = shuffle(arr)
end

see arr
