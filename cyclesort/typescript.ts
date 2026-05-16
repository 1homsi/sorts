function cycleSort(arr: number[]): number {
    let writes = 0;
    const n = arr.length;
    for (let cycleStart = 0; cycleStart < n - 1; cycleStart++) {
        let item = arr[cycleStart];
        let pos = cycleStart;
        for (let i = cycleStart + 1; i < n; i++) {
            if (arr[i] < item) pos++;
        }
        if (pos === cycleStart) continue;
        while (item === arr[pos]) pos++;
        [arr[pos], item] = [item, arr[pos]];
        writes++;
        while (pos !== cycleStart) {
            pos = cycleStart;
            for (let i = cycleStart + 1; i < n; i++) {
                if (arr[i] < item) pos++;
            }
            while (item === arr[pos]) pos++;
            [arr[pos], item] = [item, arr[pos]];
            writes++;
        }
    }
    return writes;
}

const arr: number[] = [5, 4, 3, 2, 1];
cycleSort(arr);
console.log(arr);
