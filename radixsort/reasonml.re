let getDigit = (x, exp) => (x / exp) mod 10;

let countingSort = (arr, exp) =>
    List.concat(
        List.init(10, d =>
            List.filter(x => getDigit(x, exp) == d, arr)
        )
    );

let rec radixSortLoop = (arr, maxVal, exp) =>
    if (maxVal / exp == 0) arr
    else radixSortLoop(countingSort(arr, exp), maxVal, exp * 10);

let radixSort = arr =>
    switch arr {
    | [] => []
    | _ =>
        let maxVal = List.fold_left((acc, x) => max(acc, x), 0, arr);
        radixSortLoop(arr, maxVal, 1)
    };

let result = radixSort([170, 45, 75, 90, 802, 24, 2, 66]);
List.iter(x => print_string(string_of_int(x) ++ " "), result);
print_newline();
