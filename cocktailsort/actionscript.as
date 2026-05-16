package {
    public class CocktailSort {
        public static function sort(arr:Array):Array {
            var swapped:Boolean = true;
            var start:int = 0;
            var end:int = arr.length - 1;
            while (swapped) {
                swapped = false;
                for (var i:int = start; i < end; i++) {
                    if (arr[i] > arr[i + 1]) {
                        var tmp:* = arr[i];
                        arr[i] = arr[i + 1];
                        arr[i + 1] = tmp;
                        swapped = true;
                    }
                }
                if (!swapped) break;
                swapped = false;
                end--;
                for (var j:int = end - 1; j >= start; j--) {
                    if (arr[j] > arr[j + 1]) {
                        var tmp2:* = arr[j];
                        arr[j] = arr[j + 1];
                        arr[j + 1] = tmp2;
                        swapped = true;
                    }
                }
                start++;
            }
            return arr;
        }
    }
}
