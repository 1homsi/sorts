public class x10 {
    static def cycleSort(arr: Rail[Long]): Long {
        var writes: Long = 0;
        val n = arr.size;
        for (cycleStart in 0..(n-2)) {
            var item: Long = arr(cycleStart);
            var pos: Long = cycleStart;
            for (i in (cycleStart+1)..(n-1)) {
                if (arr(i) < item) pos++;
            }
            if (pos == cycleStart) continue;
            while (item == arr(pos)) pos++;
            val tmp = arr(pos); arr(pos) = item; item = tmp;
            writes++;
            while (pos != cycleStart) {
                pos = cycleStart;
                for (i in (cycleStart+1)..(n-1)) {
                    if (arr(i) < item) pos++;
                }
                while (item == arr(pos)) pos++;
                val t = arr(pos); arr(pos) = item; item = t;
                writes++;
            }
        }
        return writes;
    }

    public static def main(args: Rail[String]): void {
        val arr = new Rail[Long](5, (i:Long) => [5L,4L,3L,2L,1L](i));
        cycleSort(arr);
        Console.OUT.println(arr);
    }
}
