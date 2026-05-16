class CombSort {
    def self sort: arr {
        n = arr size
        gap = n
        sorted = false
        { sorted not } while_true: {
            gap = (gap / 1.3) to_i
            (gap <= 1) if_true: {
                gap = 1
                sorted = true
            }
            0 upto: (n - gap - 1) do: |i| {
                (arr[i] > arr[i + gap]) if_true: {
                    tmp = arr[i]
                    arr[i] = arr[i + gap]
                    arr[i + gap] = tmp
                    sorted = false
                }
            }
        }
        arr
    }
}
