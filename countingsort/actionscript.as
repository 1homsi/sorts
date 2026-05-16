package {
    import flash.display.Sprite;

    public class CountingSort extends Sprite {
        public static function sort(arr:Array):Array {
            if (arr.length == 0) return arr;
            var min:int = arr[0], max:int = arr[0];
            for each (var v:int in arr) {
                if (v < min) min = v;
                if (v > max) max = v;
            }
            var range:int = max - min + 1;
            var count:Array = new Array(range).fill(0);
            for each (v in arr) count[v - min]++;
            for (var i:int = 1; i < range; i++) count[i] += count[i - 1];
            var output:Array = new Array(arr.length);
            for (i = arr.length - 1; i >= 0; i--) {
                output[--count[arr[i] - min]] = arr[i];
            }
            return output;
        }

        public function CountingSort() {
            trace(sort([4, 2, 2, 8, 3, 3, 1]));
        }
    }
}
