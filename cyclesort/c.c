#include <stdio.h>

int cycleSort(int arr[], int n) {
    int writes = 0;
    for (int cycleStart = 0; cycleStart < n - 1; cycleStart++) {
        int item = arr[cycleStart];
        int pos = cycleStart;
        for (int i = cycleStart + 1; i < n; i++) {
            if (arr[i] < item) pos++;
        }
        if (pos == cycleStart) continue;
        while (item == arr[pos]) pos++;
        int temp = arr[pos];
        arr[pos] = item;
        item = temp;
        writes++;
        while (pos != cycleStart) {
            pos = cycleStart;
            for (int i = cycleStart + 1; i < n; i++) {
                if (arr[i] < item) pos++;
            }
            while (item == arr[pos]) pos++;
            temp = arr[pos];
            arr[pos] = item;
            item = temp;
            writes++;
        }
    }
    return writes;
}

int main() {
    int arr[] = {5, 4, 3, 2, 1};
    int n = 5;
    cycleSort(arr, n);
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\n");
    return 0;
}
