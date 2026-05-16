class PancakeSort extends Actor;

var array<int> arr;
var int n, i, j, temp;

simulated function Sort() {
    arr[0] = 5; arr[1] = 2; arr[2] = 8;
    arr[3] = 1; arr[4] = 9; arr[5] = 3;
    n = 6;
    
    for (i = 0; i < n - 1; i++) {
        for (j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j+1]) {
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
    
    `log("Pancake Sort: " $ arr);
}

defaultproperties {
}
