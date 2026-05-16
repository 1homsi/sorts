func bitonicsort(arr, lo, cnt, dir)
{
    if (cnt > 1) {
        k = cnt / 2;
        arr = bitonicsort(arr, lo, k, 1);
        arr = bitonicsort(arr, lo + k, k, 0);
        arr = bitonicmerge(arr, lo, cnt, dir);
    }
    return arr;
}

func bitonicmerge(arr, lo, cnt, dir)
{
    if (cnt > 1) {
        k = cnt / 2;
        for (i = lo; i < lo + cnt - k; i++) {
            if ((arr(i) > arr(i + k)) == (dir == 1)) {
                tmp = arr(i);
                arr(i) = arr(i + k);
                arr(i + k) = tmp;
            }
        }
        arr = bitonicmerge(arr, lo, k, dir);
        arr = bitonicmerge(arr, lo + k, k, dir);
    }
    return arr;
}

arr = [5, 2, 8, 1, 9, 3, 7, 4];
arr = bitonicsort(arr, 0, 8, 1);
print, arr;
