def MIN_RUN = 32

def insertionSort(arr, left, right) {
    for (int i = left + 1; i <= right; i++) {
        def key = arr[i]
        int j = i - 1
        while (j >= left && arr[j] > key) {
            arr[j + 1] = arr[j]
            j--
        }
        arr[j + 1] = key
    }
}

def merge(arr, left, mid, right) {
    def lp = arr[left..mid].clone()
    def rp = arr[(mid+1)..right].clone()
    int i = 0, j = 0, k = left
    while (i < lp.size() && j < rp.size()) {
        if (lp[i] <= rp[j]) arr[k++] = lp[i++]
        else arr[k++] = rp[j++]
    }
    while (i < lp.size()) arr[k++] = lp[i++]
    while (j < rp.size()) arr[k++] = rp[j++]
}

def timsort(arr) {
    int n = arr.size()
    for (int i = 0; i < n; i += MIN_RUN) {
        insertionSort(arr, i, Math.min(i + MIN_RUN - 1, n - 1))
    }
    for (int size = MIN_RUN; size < n; size *= 2) {
        for (int left = 0; left < n; left += 2 * size) {
            int mid = Math.min(left + size - 1, n - 1)
            int right = Math.min(left + 2 * size - 1, n - 1)
            if (mid < right) merge(arr, left, mid, right)
        }
    }
    arr
}

def arr = [5, 2, 8, 1, 9, 3, 7, 4, 6]
println timsort(arr)
