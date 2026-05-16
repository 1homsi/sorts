namespace RadixSort {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    operation RadixSort(arr : Int[], max : Int) : Int[] {
        mutable result = arr;
        mutable exp = 1;
        while (exp <= max) {
            set result = CountingSortByExp(result, exp);
            set exp = exp * 10;
        }
        return result;
    }

    operation CountingSortByExp(arr : Int[], exp : Int) : Int[] {
        let n = Length(arr);
        mutable output = new Int[n];
        mutable count = new Int[10];
        for i in 0 .. n - 1 {
            set count[(arr[i] / exp) % 10] = count[(arr[i] / exp) % 10] + 1;
        }
        for i in 1 .. 9 {
            set count[i] = count[i] + count[i - 1];
        }
        for i in n - 1 .. -1 .. 0 {
            set output[count[(arr[i] / exp) % 10] - 1] = arr[i];
            set count[(arr[i] / exp) % 10] = count[(arr[i] / exp) % 10] - 1;
        }
        return output;
    }
}
