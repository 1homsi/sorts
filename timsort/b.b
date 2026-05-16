main() {
    auto arr[9], n, minrun, i, size, left, mid, right;
    auto lp[256], rp[256];

    n = 9;
    minrun = 32;
    arr[0]=5; arr[1]=2; arr[2]=8; arr[3]=1; arr[4]=9;
    arr[5]=3; arr[6]=7; arr[7]=4; arr[8]=6;

    i = 0;
    while (i < n) {
        right = i + minrun - 1;
        if (right >= n) right = n - 1;
        insertionsort(arr, i, right, lp, rp);
        i =+ minrun;
    }
    size = minrun;
    while (size < n) {
        left = 0;
        while (left < n) {
            mid = left + size - 1;
            if (mid >= n) mid = n - 1;
            right = left + 2*size - 1;
            if (right >= n) right = n - 1;
            if (mid < right) merge(arr, left, mid, right, lp, rp);
            left =+ 2*size;
        }
        size =* 2;
    }
    i = 0;
    while (i < n) { putchar(arr[i]+'0'); putchar(' '); i++; }
    putchar('*n');
}

insertionsort(arr, left, right, lp, rp) {
    auto i, j, key;
    i = left + 1;
    while (i <= right) {
        key = arr[i];
        j = i - 1;
        while (j >= left & arr[j] > key) {
            arr[j+1] = arr[j];
            j--;
        }
        arr[j+1] = key;
        i++;
    }
}

merge(arr, left, mid, right, lp, rp) {
    auto ln, rn, i, j, k;
    ln = mid - left + 1;
    rn = right - mid;
    i = 0;
    while (i < ln) { lp[i] = arr[left+i]; i++; }
    i = 0;
    while (i < rn) { rp[i] = arr[mid+1+i]; i++; }
    i = 0; j = 0; k = left;
    while (i < ln & j < rn) {
        if (lp[i] <= rp[j]) { arr[k] = lp[i]; i++; }
        else { arr[k] = rp[j]; j++; }
        k++;
    }
    while (i < ln) { arr[k] = lp[i]; i++; k++; }
    while (j < rn) { arr[k] = rp[j]; j++; k++; }
}
