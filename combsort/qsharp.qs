namespace CombSort {
    open Microsoft.Quantum.Intrinsic;

    operation CombSort(arr : Int[]) : Int[] {
        mutable result = arr;
        mutable gap = Length(arr);
        mutable swapped = true;

        while (gap > 1 or swapped) {
            set gap = (gap * 10) / 13;
            if (gap < 1) {
                set gap = 1;
            }
            set swapped = false;

            for (i in 0 .. Length(result) - gap - 1) {
                if (result[i] > result[i + gap]) {
                    let temp = result[i];
                    set result w/= i <- result[i + gap];
                    set result w/= (i + gap) <- temp;
                    set swapped = true;
                }
            }
        }
        return result;
    }

    @EntryPoint()
    operation Main() : Unit {
        let sample = [5, 2, 8, 1, 9, 3];
        let sorted = CombSort(sample);
        Message($"{sorted}");
    }
}
