main() {
    auto arr[7], n, size, i, maxIdx, left, right, tmp;
    arr[0] = 3; arr[1] = 6; arr[2] = 2; arr[3] = 7;
    arr[4] = 4; arr[5] = 1; arr[6] = 5;
    n = 7;

    size = n;
    while (size > 1) {
        maxIdx = 0;
        i = 1;
        while (i < size) {
            if (arr[i] > arr[maxIdx]) maxIdx = i;
            i++;
        }
        if (maxIdx != size - 1) {
            if (maxIdx != 0) {
                left = 0; right = maxIdx;
                while (left < right) {
                    tmp = arr[left]; arr[left] = arr[right]; arr[right] = tmp;
                    left++; right--;
                }
            }
            left = 0; right = size - 1;
            while (left < right) {
                tmp = arr[left]; arr[left] = arr[right]; arr[right] = tmp;
                left++; right--;
            }
        }
        size--;
    }

    i = 0;
    while (i < n) {
        printf("%d ", arr[i]);
        i++;
    }
    printf("*n");
}
