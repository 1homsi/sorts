namespace BogSort {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert;

    function BogSort(arr : Int[]) : Int[] {
        mutable sorted = arr;
        while (not IsSorted(sorted)) {
            set sorted = Shuffle(sorted);
        }
        return sorted;
    }

    function IsSorted(arr : Int[]) : Bool {
        for i in 0 .. Length(arr) - 2 {
            if (arr[i] > arr[i + 1]) {
                return false;
            }
        }
        return true;
    }

    function Shuffle(arr : Int[]) : Int[] {
        mutable result = arr;
        for i in 0 .. Length(arr) - 1 {
            let j = RandomIntInRange(0, Length(arr));
            let tmp = result[i];
            set result w/= i <- result[j];
            set result w/= j <- tmp;
        }
        return result;
    }
}
