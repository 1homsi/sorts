package {
    public class Mergesort {
        public static function sort(arr:Array):Array {
            if (arr.length <= 1) return arr;
            var mid:int = arr.length / 2;
            var left:Array = sort(arr.slice(0, mid));
            var right:Array = sort(arr.slice(mid));
            return merge(left, right);
        }

        private static function merge(left:Array, right:Array):Array {
            var result:Array = [];
            while (left.length && right.length) {
                if (left[0] <= right[0]) result.push(left.shift());
                else result.push(right.shift());
            }
            return result.concat(left).concat(right);
        }
    }
}
