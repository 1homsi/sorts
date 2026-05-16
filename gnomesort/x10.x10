class GnomeSort {
    public static def sort(arr: Rail[Int]): Rail[Int] {
        var i: Int = 0n;
        val n: Int = arr.size as Int;
        while (i < n) {
            if (i == 0n || arr(i) >= arr(i - 1n)) {
                i++;
            } else {
                val tmp = arr(i);
                arr(i) = arr(i - 1n);
                arr(i - 1n) = tmp;
                i--;
            }
        }
        return arr;
    }
}
