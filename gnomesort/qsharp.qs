namespace GnomeSort {
    operation GnomeSort(mut arr : Int[]) : Int[] {
        mutable i = 0;
        while (i < Length(arr)) {
            if (i == 0) {
                set i += 1;
            } elif (arr[i] < arr[i - 1]) {
                let temp = arr[i];
                set arr w/= i <- arr[i - 1];
                set arr w/= (i - 1) <- temp;
                set i -= 1;
            } else {
                set i += 1;
            }
        }
        return arr;
    }

    @EntryPoint()
    operation Main() : Int[] {
        mutable test = [5, 2, 8, 1, 9, 3];
        let sorted = GnomeSort(test);
        Message($"{sorted}");
        return sorted;
    }
}
