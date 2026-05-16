namespace QuickSort {
    open Microsoft.Quantum.Intrinsic;

    operation QuickSort(arr: Int[], idx: Int = 0): Int[] {
        if Length(arr) <= 1 {
            return arr;
        }
        let pivot = arr[0];
        mutable less = [];
        mutable greater = [];
        for i in 1..Length(arr)-1 {
            if arr[i] <= pivot {
                set less += [arr[i]];
            } else {
                set greater += [arr[i]];
            }
        }
        return QuickSort(less) + [pivot] + QuickSort(greater);
    }
}