method Partition(arr: array<int>, low: int, high: int) returns (p: int)
    requires arr != null
    requires 0 <= low < high < arr.Length
    modifies arr
    ensures low <= p <= high
{
    var pivot := arr[high];
    var i := low;
    var j := low;
    while j < high
        invariant low <= i <= j <= high
    {
        if arr[j] <= pivot {
            var tmp := arr[i]; arr[i] := arr[j]; arr[j] := tmp;
            i := i + 1;
        }
        j := j + 1;
    }
    var tmp := arr[i]; arr[i] := arr[high]; arr[high] := tmp;
    p := i;
}

method Quicksort(arr: array<int>, low: int, high: int)
    requires arr != null
    requires 0 <= low && high < arr.Length
    modifies arr
    decreases high - low
{
    if low < high {
        var p := Partition(arr, low, high);
        Quicksort(arr, low, p - 1);
        Quicksort(arr, p + 1, high);
    }
}

method Main() {
    var arr := new int[7];
    arr[0] := 3; arr[1] := 6; arr[2] := 8; arr[3] := 10;
    arr[4] := 1; arr[5] := 2; arr[6] := 1;
    Quicksort(arr, 0, 6);
    var i := 0;
    while i < 7 { print arr[i]; print " "; i := i + 1; }
}
