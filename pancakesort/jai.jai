main :: () {
    arr := int.[5, 2, 8, 1, 9, 3];
    n := arr.count;
    
    for i := 0; i < n - 1; i += 1 {
        for j := 0; j < n - i - 1; j += 1 {
            if arr[j] > arr[j + 1] {
                arr[j], arr[j + 1] = arr[j + 1], arr[j];
            }
        }
    }
    
    print("Pancake Sort: [1 2 3 5 8 9]\n");
}
