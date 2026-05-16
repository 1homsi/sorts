method GnomeSort(arr: array<int>)
    modifies arr
    ensures forall i, j :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
{
    var i := 0;
    var n := arr.Length;
    while i < n
        invariant 0 <= i <= n
    {
        if i == 0 || arr[i] >= arr[i - 1] {
            i := i + 1;
        } else {
            var tmp := arr[i];
            arr[i] := arr[i - 1];
            arr[i - 1] := tmp;
            i := i - 1;
        }
    }
}
