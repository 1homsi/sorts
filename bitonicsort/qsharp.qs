namespace BitonicSort {
    operation BitonicSort(arr: Int[], lo: Int, cnt: Int, dir: Int): Int[] {
        if (cnt > 1) {
            let k = cnt / 2;
            let arr = BitonicSort(arr, lo, k, 1);
            let arr = BitonicSort(arr, lo + k, k, 0);
            let arr = BitonicMerge(arr, lo, cnt, dir);
        }
        return arr;
    }

    operation BitonicMerge(arr: Int[], lo: Int, cnt: Int, dir: Int): Int[] {
        if (cnt > 1) {
            let k = cnt / 2;
            mutable result = arr;
            for (i in 0..cnt - k - 1) {
                if ((result[lo + i] > result[lo + i + k]) == (dir == 1)) {
                    let tmp = result[lo + i];
                    set result w/= lo + i <- result[lo + i + k];
                    set result w/= lo + i + k <- tmp;
                }
            }
            let result = BitonicMerge(result, lo, k, dir);
            let result = BitonicMerge(result, lo + k, k, dir);
            return result;
        }
        return arr;
    }

    @EntryPoint()
    operation Main(): Unit {
        let arr = [5, 2, 8, 1, 9, 3, 7, 4];
        let sorted = BitonicSort(arr, 0, Length(arr), 1);
        Message($"Result: {sorted}");
    }
}
