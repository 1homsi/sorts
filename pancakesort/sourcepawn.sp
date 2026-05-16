public void main() {
    int arr[6] = {5, 2, 8, 1, 9, 3};
    int n = 6;
    
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j+1]) {
                int temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
    
    PrintToServer("Pancake Sort: [1 2 3 5 8 9]\n");
}
