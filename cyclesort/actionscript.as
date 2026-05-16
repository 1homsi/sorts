package {
    import flash.display.Sprite;

    public class actionscript extends Sprite {
        public static function cycleSort(arr:Array):int {
            var writes:int = 0;
            var n:int = arr.length;
            for (var cycleStart:int = 0; cycleStart < n - 1; cycleStart++) {
                var item:int = arr[cycleStart];
                var pos:int = cycleStart;
                for (var i:int = cycleStart + 1; i < n; i++) {
                    if (arr[i] < item) pos++;
                }
                if (pos == cycleStart) continue;
                while (item == arr[pos]) pos++;
                var tmp:int = arr[pos]; arr[pos] = item; item = tmp;
                writes++;
                while (pos != cycleStart) {
                    pos = cycleStart;
                    for (i = cycleStart + 1; i < n; i++) {
                        if (arr[i] < item) pos++;
                    }
                    while (item == arr[pos]) pos++;
                    tmp = arr[pos]; arr[pos] = item; item = tmp;
                    writes++;
                }
            }
            return writes;
        }

        public function actionscript() {
            var arr:Array = [5, 4, 3, 2, 1];
            cycleSort(arr);
            trace(arr);
        }
    }
}
