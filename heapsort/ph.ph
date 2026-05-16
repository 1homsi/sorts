heapify arr n i =
    let left = 2 * i + 1;
        right = 2 * i + 2;
        largest0 = if (left < n && arr[left] > arr[i]) then left else i;
        largest = if (right < n && arr[right] > arr[largest0]) then right else largest0;
    in
    if largest != i then
        let vi = arr[i];
            vl = arr[largest];
            arr' = { arr with [i] = vl; [largest] = vi };
        in heapify arr' n largest
    else arr ;

heapsort arr =
    let n = length arr;
        heap = foldl (fn (a, i) => heapify a n i) arr (List.rev (range 0 (n / 2 - 1)));
        sorted = foldl (fn (a, i) =>
            let v0 = a[0]; vi = a[i];
                a' = { a with [0] = vi; [i] = v0 };
            in heapify a' i 0) heap (List.rev (range 1 (n - 1)));
    in sorted ;

val result = heapsort [12, 11, 13, 5, 6, 7];
print result;
