method InsertionSort(arr: array<int>)
    modifies arr
    ensures forall i, j :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
{
    var n := arr.Length;
    var i := 1;
    while i < n
        invariant 1 <= i <= n
        invariant forall a, b :: 0 <= a < b < i ==> arr[a] <= arr[b]
    {
        var key := arr[i];
        var j := i - 1;
        while j >= 0 && arr[j] > key
            invariant -1 <= j < i
        {
            arr[j + 1] := arr[j];
            j := j - 1;
        }
        arr[j + 1] := key;
        i := i + 1;
    }
}
