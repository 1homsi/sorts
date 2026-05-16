void setup() {
    int[] arr = {5, 2, 8, 1, 9, 3};
    int n = arr.length;
    
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
    
    println("Pancake Sort: " + java.util.Arrays.toString(arr));
    exit();
}

void draw() {
}
