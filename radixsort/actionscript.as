package {
    import flash.display.Sprite;

    public class actionscript extends Sprite {
        private static function countingSort(arr:Array, exp:int):void {
            var n:int = arr.length;
            var output:Array = new Array(n);
            var count:Array = new Array(10);
            for (var k:int = 0; k < 10; k++) count[k] = 0;
            for (var i:int = 0; i < n; i++) count[int(arr[i] / exp) % 10]++;
            for (var j:int = 1; j < 10; j++) count[j] += count[j - 1];
            for (var ii:int = n - 1; ii >= 0; ii--) {
                var idx:int = int(arr[ii] / exp) % 10;
                output[--count[idx]] = arr[ii];
            }
            for (var iii:int = 0; iii < n; iii++) arr[iii] = output[iii];
        }

        private static function radixSort(arr:Array):Array {
            if (!arr.length) return arr;
            var max:int = arr[0];
            for each (var x:int in arr) if (x > max) max = x;
            for (var exp:int = 1; int(max / exp) > 0; exp *= 10) countingSort(arr, exp);
            return arr;
        }

        public function actionscript() {
            var arr:Array = [170, 45, 75, 90, 802, 24, 2, 66];
            trace(radixSort(arr));
        }
    }
}
