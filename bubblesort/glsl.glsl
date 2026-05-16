#version 330 core

uniform int data[7];
out int sorted[7];

void bubbleSort(inout int arr[7]) {
    int n = 7;
    bool swapped = true;
    while (swapped) {
        swapped = false;
        for (int i = 0; i < n - 1; i++) {
            if (arr[i] > arr[i + 1]) {
                int tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = true;
            }
        }
        n--;
    }
}

void main() {
    int arr[7] = int[7](64, 34, 25, 12, 22, 11, 90);
    bubbleSort(arr);
    for (int i = 0; i < 7; i++) {
        sorted[i] = arr[i];
    }
}
