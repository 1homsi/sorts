#include <sourcemod>

stock void CocktailSort(int[] arr, int len) {
    int i = 0;
    while (i < len) {
        bool swapped = false;
        for (int k = 0; k < len - i - 1; k++) {
            if (arr[k] > arr[k + 1]) {
                int temp = arr[k];
                arr[k] = arr[k + 1];
                arr[k + 1] = temp;
                swapped = true;
            }
        }
        if (!swapped) break;
        i++;
        swapped = false;
        for (int k = len - i - 2; k >= 0; k--) {
            if (arr[k] > arr[k + 1]) {
                int temp = arr[k];
                arr[k] = arr[k + 1];
                arr[k + 1] = temp;
                swapped = true;
            }
        }
        if (!swapped) break;
        i++;
    }
}

public void OnPluginStart() {
    int arr[] = {5, 2, 8, 1, 9, 3};
    CocktailSort(arr, 6);
    PrintToServer("Sorted");
}
