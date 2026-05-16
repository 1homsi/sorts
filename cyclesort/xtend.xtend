import java.util.List
import java.util.ArrayList

class CycleSort {
    def static int cycleSort(List<Integer> arr) {
        var writes = 0
        val n = arr.size
        for (var cycleStart = 0; cycleStart < n - 1; cycleStart++) {
            var item = arr.get(cycleStart)
            var pos = cycleStart
            for (var i = cycleStart + 1; i < n; i++) {
                if (arr.get(i) < item) pos++
            }
            if (pos != cycleStart) {
                while (item == arr.get(pos)) pos++
                val tmp = arr.get(pos)
                arr.set(pos, item)
                item = tmp
                writes++
                while (pos != cycleStart) {
                    pos = cycleStart
                    for (var i = cycleStart + 1; i < n; i++) {
                        if (arr.get(i) < item) pos++
                    }
                    while (item == arr.get(pos)) pos++
                    val t = arr.get(pos)
                    arr.set(pos, item)
                    item = t
                    writes++
                }
            }
        }
        writes
    }

    def static void main(String[] args) {
        val arr = new ArrayList<Integer>(#[5, 4, 3, 2, 1])
        cycleSort(arr)
        println(arr)
    }
}
