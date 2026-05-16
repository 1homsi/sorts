on insertionSort(bucket)
    set n to count of bucket
    repeat with i from 2 to n
        set key to item i of bucket
        set j to i - 1
        repeat while j >= 1 and item j of bucket > key
            set item (j + 1) of bucket to item j of bucket
            set j to j - 1
        end repeat
        set item (j + 1) of bucket to key
    end repeat
    return bucket
end insertionSort

on bucketSort(arr)
    set n to count of arr
    if n = 0 then return arr
    set minV to item 1 of arr
    set maxV to item 1 of arr
    repeat with v in arr
        if v < minV then set minV to v
        if v > maxV then set maxV to v
    end repeat
    set buckets to {}
    repeat n times
        set end of buckets to {}
    end repeat
    repeat with num in arr
        set idx to (floor of ((num - minV) / (maxV - minV + 1) * n)) + 1
        if idx > n then set idx to n
        set item idx of buckets to (item idx of buckets) & {num}
    end repeat
    set result to {}
    repeat with bucket in buckets
        set sorted to insertionSort(bucket as list)
        set result to result & sorted
    end repeat
    return result
end bucketSort

set data to {0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68}
set sorted to bucketSort(data)
log sorted
