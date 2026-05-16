main()
{
    auto arr[8];
    auto i, j, k, tmp;

    arr[0] = 3; arr[1] = 7; arr[2] = 4; arr[3] = 8;
    arr[4] = 6; arr[5] = 2; arr[6] = 1; arr[7] = 5;

    bitonicsort(arr, 0, 8, 1);

    i = 0;
    while (i < 8) {
        printf("%d ", arr[i]);
        i++;
    }
    printf("*n");
}

bitonicsort(arr, lo, cnt, dir)
{
    auto k;
    if (cnt > 1) {
        k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo+k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
}

bitonicmerge(arr, lo, cnt, dir)
{
    auto k, i, tmp;
    if (cnt > 1) {
        k = cnt / 2;
        i = lo;
        while (i < lo+k) {
            if (dir == (arr[i] > arr[i+k])) {
                tmp = arr[i]; arr[i] = arr[i+k]; arr[i+k] = tmp;
            }
            i++;
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo+k, k, dir);
    }
}
