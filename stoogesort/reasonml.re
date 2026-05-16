let stoogeSort = (arr, first, last) => {
    let arr = Array.copy(arr);
    let rec sort = (first, last) => {
        if (arr[first] > arr[last]) {
            let tmp = arr[first];
            arr[first] = arr[last];
            arr[last] = tmp;
        };
        let n = last - first + 1;
        if (n > 2) {
            let t = n * 2 / 3;
            sort(first, first + t - 1);
            sort(last - t + 1, last);
            sort(first, first + t - 1);
        };
    };
    sort(first, last);
    arr;
};

let arr = [|3, 1, 4, 1, 5, 9, 2, 6|];
let sorted = stoogeSort(arr, 0, Array.length(arr) - 1);
Array.iter(x => print_int(x), sorted);
print_newline();
