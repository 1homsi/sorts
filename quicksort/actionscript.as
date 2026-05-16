package {
    import flash.display.Sprite;

    public class actionscript extends Sprite {
        public function actionscript() {
            var arr:Array = [3, 6, 8, 10, 1, 2, 1];
            quicksort(arr, 0, arr.length - 1);
            trace(arr);
        }

        private function partition(arr:Array, low:int, high:int):int {
            var pivot:int = arr[high];
            var i:int = low;
            for (var j:int = low; j < high; j++) {
                if (arr[j] <= pivot) {
                    var tmp:int = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
                    i++;
                }
            }
            var tmp2:int = arr[i]; arr[i] = arr[high]; arr[high] = tmp2;
            return i;
        }

        private function quicksort(arr:Array, low:int, high:int):void {
            if (low < high) {
                var p:int = partition(arr, low, high);
                quicksort(arr, low, p - 1);
                quicksort(arr, p + 1, high);
            }
        }
    }
}
