func compareAndSwap(_ arr: inout [Int], _ i: Int, _ j: Int, _ direction: Bool) {
    if direction == (arr[i] > arr[j]) {
        arr.swapAt(i, j)
    }
}

func bitonicMerge(_ arr: inout [Int], _ lo: Int, _ cnt: Int, _ direction: Bool) {
    if cnt > 1 {
        let k = cnt / 2
        for i in lo..<lo + k {
            compareAndSwap(&arr, i, i + k, direction)
        }
        bitonicMerge(&arr, lo, k, direction)
        bitonicMerge(&arr, lo + k, k, direction)
    }
}

func bitonicSort(_ arr: inout [Int], _ lo: Int, _ cnt: Int, _ direction: Bool) {
    if cnt > 1 {
        let k = cnt / 2
        bitonicSort(&arr, lo, k, true)
        bitonicSort(&arr, lo + k, k, false)
        bitonicMerge(&arr, lo, cnt, direction)
    }
}

var data = [3, 7, 4, 8, 6, 2, 1, 5]
bitonicSort(&data, 0, data.count, true)
print(data)
