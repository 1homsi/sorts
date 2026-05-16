class PancakeSort {
    def self flip: arr k: k {
        left = 0
        right = k
        { left < right } while_true: {
            tmp = arr[left]
            arr[left] = arr[right]
            arr[right] = tmp
            left = left + 1
            right = right - 1
        }
    }

    def self find_max_idx: arr size: size {
        max_idx = 0
        i = 1
        { i < size } while_true: {
            arr[i] > arr[max_idx] if_true: { max_idx = i }
            i = i + 1
        }
        max_idx
    }

    def self sort: arr {
        size = arr size
        { size > 1 } while_true: {
            max_idx = self find_max_idx: arr size: size
            max_idx != (size - 1) if_true: {
                max_idx != 0 if_true: { self flip: arr k: max_idx }
                self flip: arr k: (size - 1)
            }
            size = size - 1
        }
        arr
    }
}

arr = [3, 6, 2, 7, 4, 1, 5]
PancakeSort sort: arr . println
