namespace CountingSort {
    operation CountingSort(arr : Int[]) : Int[] {
        if Length(arr) == 0 {
            return [];
        }

        mutable max = 0;
        for i in 0..Length(arr) - 1 {
            if arr[i] > max {
                set max = arr[i];
            }
        }

        mutable count = new Int[max + 1];
        for i in 0..max {
            set count[i] = 0;
        }

        for i in 0..Length(arr) - 1 {
            set count[arr[i]] = count[arr[i]] + 1;
        }

        mutable output = new Int[0];
        for i in 0..max {
            for j in 0..count[i] - 1 {
                set output += [i];
            }
        }

        return output;
    }

    @EntryPoint()
    operation Main() : Unit {
        let test = [5, 2, 8, 1, 9, 3];
        let result = CountingSort(test);
        Message($"{result}");
    }
}
