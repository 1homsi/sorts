package {
    public class CombSort {
        public static function sort(arr:Array):Array {
            var n:int = arr.length;
            var gap:int = n;
            var sorted:Boolean = false;
            while (!sorted) {
                gap = int(gap / 1.3);
                if (gap <= 1) {
                    gap = 1;
                    sorted = true;
                }
                for (var i:int = 0; i + gap < n; i++) {
                    if (arr[i] > arr[i + gap]) {
                        var tmp:int = arr[i];
                        arr[i] = arr[i + gap];
                        arr[i + gap] = tmp;
                        sorted = false;
                    }
                }
            }
            return arr;
        }
    }
}
