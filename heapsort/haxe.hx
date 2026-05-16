class Heapsort {
    static function heapify(arr:Array<Int>, n:Int, i:Int):Void {
        var largest = i, left = 2*i+1, right = 2*i+2;
        if (left < n && arr[left] > arr[largest]) largest = left;
        if (right < n && arr[right] > arr[largest]) largest = right;
        if (largest != i) {
            var tmp = arr[i]; arr[i] = arr[largest]; arr[largest] = tmp;
            heapify(arr, n, largest);
        }
    }

    static function heapsort(arr:Array<Int>):Array<Int> {
        var n = arr.length;
        var i = Std.int(n / 2) - 1;
        while (i >= 0) { heapify(arr, n, i); i--; }
        i = n - 1;
        while (i > 0) {
            var tmp = arr[0]; arr[0] = arr[i]; arr[i] = tmp;
            heapify(arr, i, 0);
            i--;
        }
        return arr;
    }

    static function main():Void {
        var arr = [12, 11, 13, 5, 6, 7];
        heapsort(arr);
        trace(arr);
    }
}
