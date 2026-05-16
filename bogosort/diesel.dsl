module bogosort where

function is_sorted(arr: [Int]) -> Bool {
    let n = length(arr);
    for i in 0 .. n-2 {
        if arr[i] > arr[i+1] { return false; }
    }
    return true;
}

function shuffle(arr: mut [Int]) {
    let n = length(arr);
    for i in (n-1) downto 1 {
        let j = random_int(0, i);
        let tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
}

function bogosort(arr: mut [Int]) {
    while !is_sorted(arr) {
        shuffle(arr);
    }
}

let arr = [3, 1, 4, 1, 5, 9, 2, 6];
bogosort(arr);
print(arr);
