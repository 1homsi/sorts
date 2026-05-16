local arr = [5, 2, 8, 1, 9, 3];
local n = arr.len();

for (local i = 0; i < n - 1; i++) {
    for (local j = 0; j < n - i - 1; j++) {
        if (arr[j] > arr[j + 1]) {
            local temp = arr[j];
            arr[j] = arr[j + 1];
            arr[j + 1] = temp;
        }
    }
}

print("Pancake Sort: " + arr + "\n");
