package {
    import flash.display.Sprite;

    public class BubbleSort extends Sprite {
        public function BubbleSort() {
            var arr:Array = [64, 34, 25, 12, 22, 11, 90];
            bubbleSort(arr);
            trace(arr);
        }

        private function bubbleSort(arr:Array):void {
            var n:int = arr.length;
            var swapped:Boolean;
            do {
                swapped = false;
                for (var i:int = 0; i < n - 1; i++) {
                    if (arr[i] > arr[i + 1]) {
                        var tmp:int = arr[i];
                        arr[i] = arr[i + 1];
                        arr[i + 1] = tmp;
                        swapped = true;
                    }
                }
                n--;
            } while (swapped);
        }
    }
}
