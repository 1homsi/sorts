package {
    public class GnomeSort {
        public static function sort(arr:Array):Array {
            var i:int = 0;
            while (i < arr.length) {
                if (i == 0 || arr[i] >= arr[i - 1]) {
                    i++;
                } else {
                    var tmp:* = arr[i];
                    arr[i] = arr[i - 1];
                    arr[i - 1] = tmp;
                    i--;
                }
            }
            return arr;
        }
    }
}
