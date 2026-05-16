class SelectionSort {
    static def selectionSort(arr: Rail[Int]): Rail[Int] {
        val n = arr.size;
        for (i in 0..(n-1)) {
            var minIdx: Long = i;
            for (j in (i+1)..(n-1)) {
                if (arr(j) < arr(minIdx)) minIdx = j;
            }
            val tmp = arr(i); arr(i) = arr(minIdx); arr(minIdx) = tmp;
        }
        return arr;
    }
}
