namespace MergeSort {
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Intrinsic;
    
    operation MergeSort(arr: Int[]): Int[] {
        let n = Length(arr);
        if (n <= 1) {
            return arr;
        }
        let mid = n / 2;
        let left = MergeSort(arr[0..mid-1]);
        let right = MergeSort(arr[mid..n-1]);
        return Merge(left, right);
    }
    
    function Merge(left: Int[], right: Int[]): Int[] {
        mutable result = [];
        mutable i = 0;
        mutable j = 0;
        
        while (i < Length(left) and j < Length(right)) {
            if (left[i] <= right[j]) {
                set result += [left[i]];
                set i += 1;
            } else {
                set result += [right[j]];
                set j += 1;
            }
        }
        
        set result += left[i..];
        set result += right[j..];
        return result;
    }
}

operation Main(): Unit {
    let arr = [5, 2, 8, 1, 9, 3];
    Message($"{MergeSort(arr)}");
}
