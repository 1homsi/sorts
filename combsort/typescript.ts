function combSort(arr: number[]): number[] {
    let n = arr.length;
    let gap = n;
    const shrink = 1.3;
    let sorted = false;
    while (!sorted) {
        gap = Math.floor(gap / shrink);
        if (gap <= 1) {
            gap = 1;
            sorted = true;
        }
        for (let i = 0; i + gap < n; i++) {
            if (arr[i] > arr[i + gap]) {
                [arr[i], arr[i + gap]] = [arr[i + gap], arr[i]];
                sorted = false;
            }
        }
    }
    return arr;
}
