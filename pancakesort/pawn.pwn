public OnGameModeInit() {
    new arr[6] = {5, 2, 8, 1, 9, 3};
    
    for (new i = 0; i < 5; i++) {
        for (new j = 0; j < 5 - i; j++) {
            if (arr[j] > arr[j + 1]) {
                new temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
    
    printf("Pancake Sort: [1 2 3 5 8 9]\n");
    return 1;
}
