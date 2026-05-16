package {
    import flash.display.Sprite;

    public class actionscript extends Sprite {
        public function shellSort(arr:Array):Array {
            var n:int = arr.length;
            for (var gap:int = n >> 1; gap > 0; gap >>= 1) {
                for (var i:int = gap; i < n; i++) {
                    var temp:int = arr[i];
                    var j:int = i;
                    while (j >= gap && arr[j - gap] > temp) {
                        arr[j] = arr[j - gap];
                        j -= gap;
                    }
                    arr[j] = temp;
                }
            }
            return arr;
        }

        public function actionscript() {
            var arr:Array = [64, 34, 25, 12, 22, 11, 90];
            trace(shellSort(arr));
        }
    }
}
