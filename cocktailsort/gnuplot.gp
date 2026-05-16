function cocktailSort(arr) {
    let n = arr.length;
    let swapped = true;
    let start = 0;
    let end = n;
    
    while (swapped) {
        swapped = false;
        
        for (let i = start; i < end - 1; i++) {
            if (arr[i] > arr[i + 1]) {
                [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
                swapped = true;
            }
        }
        
        if (!swapped) break;
        
        swapped = false;
        end--;
        
        for (let i = end - 2; i >= start; i--) {
            if (arr[i] > arr[i + 1]) {
                [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
                swapped = true;
            }
        }
        
        start++;
    }
    
    return arr;
}
