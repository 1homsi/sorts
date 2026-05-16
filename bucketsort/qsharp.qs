operation BucketSort(arr: Int[], maxVal: Int) : Int[] {
    if maxVal == 0 { return arr; }
    mutable buckets = new Int[][maxVal];
    for i in 0..maxVal-1 {
        set buckets w/= i <- new Int[0];
    }
    for num in arr {
        let idx = num;
        if idx >= 0 and idx < maxVal {
            set buckets w/= idx <- buckets[idx] + [num];
        }
    }
    mutable result = [];
    for i in 0..maxVal-1 {
        for num in buckets[i] {
            set result = result + [num];
        }
    }
    return result;
}
Message("Result").