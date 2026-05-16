class CombSort {
    static def sort(arr: Rail[Int]): Rail[Int] {
        val n = arr.size;
        var gap: Long = n;
        var sorted: Boolean = false;
        while (!sorted) {
            gap = (gap as Double / 1.3) as Long;
            if (gap <= 1) {
                gap = 1;
                sorted = true;
            }
            for (i in 0..(n - gap - 1)) {
                if (arr(i) > arr(i + gap)) {
                    val tmp = arr(i);
                    arr(i) = arr(i + gap);
                    arr(i + gap) = tmp;
                    sorted = false;
                }
            }
        }
        return arr;
    }
}
