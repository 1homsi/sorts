class Haxe {
    static function countingSort(arr:Array<Int>, exp:Int):Void {
        var n = arr.length;
        var output = [for (_ in 0...n) 0];
        var count = [for (_ in 0...10) 0];
        for (x in arr) count[Std.int(x / exp) % 10]++;
        for (i in 1...10) count[i] += count[i - 1];
        var i = n - 1;
        while (i >= 0) {
            var idx = Std.int(arr[i] / exp) % 10;
            output[--count[idx]] = arr[i];
            i--;
        }
        for (i in 0...n) arr[i] = output[i];
    }

    static function radixSort(arr:Array<Int>):Array<Int> {
        if (arr.length == 0) return arr;
        var max = arr[0];
        for (x in arr) if (x > max) max = x;
        var exp = 1;
        while (Std.int(max / exp) > 0) {
            countingSort(arr, exp);
            exp *= 10;
        }
        return arr;
    }

    static function main() {
        var arr = [170, 45, 75, 90, 802, 24, 2, 66];
        radixSort(arr);
        trace(arr);
    }
}
