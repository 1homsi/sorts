function flip(arr, k) {
    let left = 0, right = k;
    while (left < right) {
        [arr[left], arr[right]] = [arr[right], arr[left]];
        left++; right--;
    }
}

function pancakeSort(arr) {
    for (let size = arr.length; size > 1; size--) {
        let maxIdx = 0;
        for (let i = 1; i < size; i++) {
            if (arr[i] > arr[maxIdx]) maxIdx = i;
        }
        if (maxIdx !== size - 1) {
            if (maxIdx !== 0) flip(arr, maxIdx);
            flip(arr, size - 1);
        }
    }
    return arr;
}

console.log(pancakeSort([3, 6, 2, 7, 4, 1, 5]));
