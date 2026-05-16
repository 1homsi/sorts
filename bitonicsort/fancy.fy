class BitonicSort {
    def compare_and_swap: arr at: i with: j dir: direction {
        ai = arr[i]
        aj = arr[j]
        if: (direction == (ai > aj)) do: {
            arr[i] = aj
            arr[j] = ai
        }
    }

    def bitonic_merge: arr lo: lo cnt: cnt dir: direction {
        if: (cnt > 1) do: {
            k = cnt / 2
            lo to: (lo + k - 1) do: |i| {
                compare_and_swap: arr at: i with: (i + k) dir: direction
            }
            bitonic_merge: arr lo: lo cnt: k dir: direction
            bitonic_merge: arr lo: (lo + k) cnt: k dir: direction
        }
    }

    def bitonic_sort: arr lo: lo cnt: cnt dir: direction {
        if: (cnt > 1) do: {
            k = cnt / 2
            bitonic_sort: arr lo: lo cnt: k dir: true
            bitonic_sort: arr lo: (lo + k) cnt: k dir: false
            bitonic_merge: arr lo: lo cnt: cnt dir: direction
        }
    }
}

data = [3, 7, 4, 8, 6, 2, 1, 5]
b = BitonicSort new
b bitonic_sort: data lo: 0 cnt: (data size) dir: true
data println
