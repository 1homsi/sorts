proc combSort(arr: [] int) {
    const n = arr.size;
    var gap = n;
    var sorted = false;
    while !sorted {
        gap = (gap:real / 1.3):int;
        if gap <= 1 {
            gap = 1;
            sorted = true;
        }
        for i in 0..#(n - gap) {
            if arr[i] > arr[i + gap] {
                arr[i] <=> arr[i + gap];
                sorted = false;
            }
        }
    }
}
