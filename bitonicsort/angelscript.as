void bitonicsort(array<int>@ arr, int lo, int cnt, int dir) {
    if (cnt > 1) {
        int k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
}

void bitonicmerge(array<int>@ arr, int lo, int cnt, int dir) {
    if (cnt > 1) {
        int k = cnt / 2;
        for (int i = lo; i < lo + cnt - k; i++) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                int tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
}

void main() {
    array<int> arr = {5, 2, 8, 1, 9, 3, 7, 4};
    bitonicsort(arr, 0, arr.length(), 1);
    for (int i = 0; i < arr.length(); i++) {
        print(arr[i] + " ");
    }
}
