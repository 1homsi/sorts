function bogosort(arr) {
    while (!arr.every((v, i, a) => i === 0 || a[i-1] <= v)) {
        for (let i = arr.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [arr[i], arr[j]] = [arr[j], arr[i]];
        }
    }
    return arr;
}
