package {
    import flash.display.Sprite;

    public class actionscript extends Sprite {
        private static function flip(arr:Array, k:int):void {
            var left:int = 0, right:int = k, tmp:int;
            while (left < right) {
                tmp = arr[left]; arr[left] = arr[right]; arr[right] = tmp;
                left++; right--;
            }
        }

        private static function pancakeSort(arr:Array):Array {
            var size:int = arr.length;
            while (size > 1) {
                var maxIdx:int = 0;
                for (var i:int = 1; i < size; i++) {
                    if (arr[i] > arr[maxIdx]) maxIdx = i;
                }
                if (maxIdx != size - 1) {
                    if (maxIdx != 0) flip(arr, maxIdx);
                    flip(arr, size - 1);
                }
                size--;
            }
            return arr;
        }

        public function actionscript() {
            var arr:Array = [3, 6, 2, 7, 4, 1, 5];
            trace(pancakeSort(arr));
        }
    }
}
