int arr[6];
arr[0] = 5; arr[1] = 2; arr[2] = 8;
arr[3] = 1; arr[4] = 9; arr[5] = 3;
int n = 6;

for (0 => int i; i < n - 1; i++) {
    for (0 => int j; j < n - i - 1; j++) {
        if (arr[j] > arr[j+1]) {
            arr[j] => int temp;
            arr[j+1] => arr[j];
            temp => arr[j+1];
        }
    }
}

<<< "Pancake Sort: " >>>;
