fun insertion_sort(arr, n) =
    for i from 1 to n-1 do
        let key = arr[i] in
        let j = ref (i-1) in
        while (!j >= 0) andalso (arr[!j] > key) do (
            arr[!j+1] := arr[!j];
            j := !j - 1
        );
        arr[!j+1] := key
    done;
    arr
