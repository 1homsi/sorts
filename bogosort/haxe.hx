class Main {
    static function isSorted(arr: Array<Int>): Bool {
        for (i in 0...arr.length - 1) {
            if (arr[i] > arr[i + 1]) return false;
        }
        return true;
    }

    static function shuffle(arr: Array<Int>): Void {
        var n = arr.length;
        for (i in 0...n) {
            var j = Std.int(Math.random() * (n - i)) + i;
            var tmp = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
        }
    }

    static function bogosort(arr: Array<Int>): Array<Int> {
        while (!isSorted(arr)) {
            shuffle(arr);
        }
        return arr;
    }

    static function main() {
        var arr = [3, 1, 4, 1, 5, 9, 2, 6];
        trace(bogosort(arr));
    }
}
