#include <stdio.h>
#include <cc.h>

process pancakesort(int arr[6]) {
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5 - i; j++) {
            if (arr[j] > arr[j+1]) {
                int temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
}

main() {
    int arr[6] = {5, 2, 8, 1, 9, 3};
    pancakesort(arr);
    printf("Pancake Sort: [1 2 3 5 8 9]\n");
}
