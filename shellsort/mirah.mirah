def shellSort(arr:int[]):int[]
    n = arr.length
    gap = n / 2
    while gap > 0
        i = gap
        while i < n
            temp = arr[i]
            j = i
            while j >= gap && arr[j - gap] > temp
                arr[j] = arr[j - gap]
                j -= gap
            end
            arr[j] = temp
            i += 1
        end
        gap /= 2
    end
    arr
end

arr = int[]{64, 34, 25, 12, 22, 11, 90}
puts shellSort(arr).to_a.join(" ")
