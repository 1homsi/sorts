function timsort(arr) {
    if (arr.length <= 1) return arr;

    const minRun = 32;

    function insertionSort(a, left, right) {
        for (let i = left + 1; i <= right; i++) {
            const key = a[i];
            let j = i - 1;
            while (j >= left && a[j] > key) {
                a[j + 1] = a[j];
                j--;
            }
            a[j + 1] = key;
        }
        return a;
    }

    function merge(a, left, mid, right) {
        const leftPart = a.slice(left, mid + 1);
        const rightPart = a.slice(mid + 1, right + 1);
        let i = 0, j = 0, k = left;
        while (i < leftPart.length && j < rightPart.length) {
            if (leftPart[i] <= rightPart[j]) {
                a[k++] = leftPart[i++];
            } else {
                a[k++] = rightPart[j++];
            }
        }
        while (i < leftPart.length) a[k++] = leftPart[i++];
        while (j < rightPart.length) a[k++] = rightPart[j++];
        return a;
    }

    for (let start = 0; start < arr.length; start += minRun) {
        const end = Math.min(start + minRun - 1, arr.length - 1);
        insertionSort(arr, start, end);
    }

    for (let size = minRun; size < arr.length; size *= 2) {
        for (let start = 0; start < arr.length; start += size * 2) {
            const mid = start + size - 1;
            const end = Math.min(start + size * 2 - 1, arr.length - 1);
            if (mid < end) merge(arr, start, mid, end);
        }
    }

    return arr;
}