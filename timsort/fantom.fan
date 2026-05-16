class TimSort {
    static const Int minRun := 32

    static Void insertionSort(Int[] arr, Int left, Int right) {
        for (i := left + 1; i <= right; i++) {
            key := arr[i]
            j := i - 1
            while (j >= left && arr[j] > key) {
                arr[j+1] = arr[j]
                j--
            }
            arr[j+1] = key
        }
    }

    static Void merge(Int[] arr, Int left, Int mid, Int right) {
        lp := arr[left..mid]
        rp := arr[mid+1..right]
        i := 0; j := 0; k := left
        while (i < lp.size && j < rp.size) {
            if (lp[i] <= rp[j]) arr[k++] = lp[i++]
            else arr[k++] = rp[j++]
        }
        while (i < lp.size) arr[k++] = lp[i++]
        while (j < rp.size) arr[k++] = rp[j++]
    }

    static Int[] timsort(Int[] arr) {
        n := arr.size
        for (i := 0; i < n; i += minRun) {
            insertionSort(arr, i, (i + minRun - 1).min(n - 1))
        }
        for (sz := minRun; sz < n; sz *= 2) {
            for (left := 0; left < n; left += 2 * sz) {
                mid := (left + sz - 1).min(n - 1)
                right := (left + 2 * sz - 1).min(n - 1)
                if (mid < right) merge(arr, left, mid, right)
            }
        }
        return arr
    }

    static Void main() {
        arr := [5, 2, 8, 1, 9, 3, 7, 4, 6]
        echo(timsort(arr))
    }
}
