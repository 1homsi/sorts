package {
    import flash.display.Sprite;

    public class actionscript extends Sprite {
        private static function compareAndSwap(arr:Array, i:int, j:int, direction:Boolean):void {
            if (direction == (arr[i] > arr[j])) {
                var tmp:int = arr[i];
                arr[i] = arr[j];
                arr[j] = tmp;
            }
        }

        private static function bitonicMerge(arr:Array, lo:int, cnt:int, direction:Boolean):void {
            if (cnt > 1) {
                var k:int = cnt / 2;
                for (var i:int = lo; i < lo + k; i++) {
                    compareAndSwap(arr, i, i + k, direction);
                }
                bitonicMerge(arr, lo, k, direction);
                bitonicMerge(arr, lo + k, k, direction);
            }
        }

        private static function bitonicSort(arr:Array, lo:int, cnt:int, direction:Boolean):void {
            if (cnt > 1) {
                var k:int = cnt / 2;
                bitonicSort(arr, lo, k, true);
                bitonicSort(arr, lo + k, k, false);
                bitonicMerge(arr, lo, cnt, direction);
            }
        }

        public function actionscript() {
            var data:Array = [3, 7, 4, 8, 6, 2, 1, 5];
            bitonicSort(data, 0, data.length, true);
            trace(data);
        }
    }
}
