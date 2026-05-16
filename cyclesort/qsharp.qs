namespace CycleSort {
    operation CycleSort(arr: Int[]): Int[] {
        let n = Length(arr);
        mutable result = arr;
        for pos in 0..n-1 {
            mutable item = result[pos];
            mutable cycles = 0;
            for i in 0..n-1 {
                if i != pos and result[i] < item {
                    set cycles = cycles + 1;
                }
            }
            if cycles == 0 {
                continue;
            }
            while result[pos] == item {
                set pos = pos + 1;
            }
            mutable temp = result[pos];
            set result = result w/ pos <- item;
            set item = temp;
            while cycles > 0 {
                set cycles = 0;
                for i in 0..n-1 {
                    if i != pos and result[i] < item {
                        set cycles = cycles + 1;
                    }
                }
                while result[pos] == item {
                    set pos = pos + 1;
                }
                set temp = result[pos];
                set result = result w/ pos <- item;
                set item = temp;
                set cycles = cycles - 1;
            }
        }
        return result;
    }

    @EntryPoint()
    operation Main(): Unit {
        let arr = [5, 2, 8, 1, 9, 3];
        let sorted = CycleSort(arr);
        Message($"{sorted}");
    }
}
