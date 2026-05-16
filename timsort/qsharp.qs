namespace TimSort {
    operation TimSort(arr : Int[], minSize : Int) : Int[] {
        return MergeSort(arr, minSize);
    }
    
    operation MergeSort(arr : Int[], minSize : Int) : Int[] {
        if Length(arr) <= 1 {
            return arr;
        }
        if Length(arr) <= minSize {
            return InsertionSort(arr);
        }
        
        let mid = Length(arr) / 2;
        let left = arr[0 .. mid - 1];
        let right = arr[mid .. Length(arr) - 1];
        
        return Merge(MergeSort(left, minSize), MergeSort(right, minSize));
    }
    
    operation InsertionSort(arr : Int[]) : Int[] {
        mutable result = arr;
        for i in 1 .. Length(result) - 1 {
            let key = result[i];
            mutable j = i - 1;
            while j >= 0 and result[j] > key {
                set result w/= j + 1 <- result[j];
                set j = j - 1;
            }
            set result w/= j + 1 <- key;
        }
        return result;
    }
    
    operation Merge(left : Int[], right : Int[]) : Int[] {
        mutable result = [];
        mutable i = 0;
        mutable j = 0;
        
        while i < Length(left) and j < Length(right) {
            if left[i] <= right[j] {
                set result = result + [left[i]];
                set i = i + 1;
            } else {
                set result = result + [right[j]];
                set j = j + 1;
            }
        }
        
        while i < Length(left) {
            set result = result + [left[i]];
            set i = i + 1;
        }
        while j < Length(right) {
            set result = result + [right[j]];
            set j = j + 1;
        }
        
        return result;
    }
}
