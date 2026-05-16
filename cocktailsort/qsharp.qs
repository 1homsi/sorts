namespace CocktailSort {
    open Microsoft.Quantum.Intrinsic;
    
    operation CocktailSortArray(arr : Int[]) : Int[] {
        mutable result = arr;
        let n = Length(arr);
        mutable i = 0;
        
        while (i < n) {
            mutable swapped = false;
            for (k in 0 .. n - i - 2) {
                if (result[k] > result[k + 1]) {
                    let temp = result[k];
                    set result w/= k <- result[k + 1];
                    set result w/= k + 1 <- temp;
                    set swapped = true;
                }
            }
            if (not swapped) {
                return result;
            }
            set i += 1;
            set swapped = false;
            for (k in n - i - 2 .. -1 .. 0) {
                if (result[k] > result[k + 1]) {
                    let temp = result[k];
                    set result w/= k <- result[k + 1];
                    set result w/= k + 1 <- temp;
                    set swapped = true;
                }
            }
            if (not swapped) {
                return result;
            }
            set i += 1;
        }
        return result;
    }
}
