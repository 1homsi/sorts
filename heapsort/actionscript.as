package {
    public class actionscript {
        public static function heapify(arr:Array, n:int, i:int):void {
            var largest:int = i, left:int = 2*i+1, right:int = 2*i+2, tmp:int;
            if (left < n && arr[left] > arr[largest]) largest = left;
            if (right < n && arr[right] > arr[largest]) largest = right;
            if (largest != i) {
                tmp = arr[i]; arr[i] = arr[largest]; arr[largest] = tmp;
                heapify(arr, n, largest);
            }
        }

        public static function heapsort(arr:Array):Array {
            var n:int = arr.length, tmp:int;
            for (var i:int = int(n/2)-1; i >= 0; i--) heapify(arr, n, i);
            for (i = n-1; i > 0; i--) {
                tmp = arr[0]; arr[0] = arr[i]; arr[i] = tmp;
                heapify(arr, i, 0);
            }
            return arr;
        }

        public static function main():void {
            var arr:Array = [12, 11, 13, 5, 6, 7];
            heapsort(arr);
            trace(arr);
        }
    }
}
