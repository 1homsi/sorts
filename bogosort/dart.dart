import 'dart:math';

bool isSorted(List<int> arr) {
    for (int i = 0; i < arr.length - 1; i++) {
        if (arr[i] > arr[i + 1]) return false;
    }
    return true;
}

void bogosort(List<int> arr) {
    while (!isSorted(arr)) {
        arr.shuffle();
    }
}
