cocktail_sort :: (arr: [] int) {
    n := arr.count;
    i := 0;
    while i < n {
        swapped := false;
        for k in 0..(n - i - 2) {
            if arr[k] > arr[k + 1] {
                temp := arr[k];
                arr[k] = arr[k + 1];
                arr[k + 1] = temp;
                swapped = true;
            }
        }
        if !swapped break;
        i += 1;
        swapped = false;
        for k in (n - i - 2)...0 {
            if arr[k] > arr[k + 1] {
                temp := arr[k];
                arr[k] = arr[k + 1];
                arr[k + 1] = temp;
                swapped = true;
            }
        }
        if !swapped break;
        i += 1;
    }
}

main :: () {
    arr := int.[5, 2, 8, 1, 9, 3];
    cocktail_sort(arr);
    print(arr);
}
