method selectionSort(arr: array<int>)
    modifies arr
    ensures forall i, j :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
{
    var n := arr.Length;
    for i := 0 to n - 1 {
        var minIdx := i;
        for j := i + 1 to n - 1 {
            if arr[j] < arr[minIdx] {
                minIdx := j;
            }
        }
        var tmp := arr[i];
        arr[i] := arr[minIdx];
        arr[minIdx] := tmp;
    }
}
