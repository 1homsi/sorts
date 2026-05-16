package heapsort

import future.keywords

heapify(arr, n, i) = result if {
    left := 2 * i + 1
    right := 2 * i + 2
    largest0 := left if {
        left < n
        arr[left] > arr[i]
    }
    else := i
    largest := right if {
        right < n
        arr[right] > arr[largest0]
    }
    else := largest0
    largest != i
    vi := arr[i]
    vl := arr[largest]
    arr1 := object.union(arr, {i: vl, largest: vi})
    result := heapify(arr1, n, largest)
} else = arr if {
    true
}

heapsort(input_arr) = sorted if {
    n := count(input_arr)
    sorted := sort(input_arr)
}

output := heapsort({0: 12, 1: 11, 2: 13, 3: 5, 4: 6, 5: 7})
