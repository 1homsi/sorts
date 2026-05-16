MIN_RUN = 32

func insertionSort arr, left, right
    for i = left+1 to right
        key = arr[i]
        j = i - 1
        while j >= left and arr[j] > key
            arr[j+1] = arr[j]
            j--
        end
        arr[j+1] = key
    next

func mergeParts arr, left, mid, right
    lp = []
    rp = []
    for x = left to mid add(lp, arr[x]) next
    for x = mid+1 to right add(rp, arr[x]) next
    i = 1 j = 1 k = left
    ln = len(lp) rn = len(rp)
    while i <= ln and j <= rn
        if lp[i] <= rp[j]
            arr[k] = lp[i] i++
        else
            arr[k] = rp[j] j++
        end
        k++
    end
    while i <= ln arr[k] = lp[i] i++ k++ end
    while j <= rn arr[k] = rp[j] j++ k++ end

arr = [5,2,8,1,9,3,7,4,6]
n = len(arr)
i = 1
while i <= n
    right = min(i+MIN_RUN-1, n)
    insertionSort(arr, i, right)
    i += MIN_RUN
end
size = MIN_RUN
while size < n
    left = 1
    while left <= n
        mid = min(left+size-1, n)
        right = min(left+2*size-1, n)
        if mid < right mergeParts(arr, left, mid, right) end
        left += 2*size
    end
    size *= 2
end
see arr
