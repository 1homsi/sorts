function isSorted(arr: number[]): boolean {
    for (let i = 0; i < arr.length - 1; i++) {
        if (arr[i] > arr[i + 1]) return false;
    }
    return true;
}

function shuffle(arr: number[]): void {
    for (let i = arr.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [arr[i], arr[j]] = [arr[j], arr[i]];
    }
}

function bogosort(arr: number[]): number[] {
    while (!isSorted(arr)) {
        shuffle(arr);
    }
    return arr;
}

const arr: number[] = [3, 1, 4, 1, 5, 9, 2, 6];
console.log(bogosort(arr));
