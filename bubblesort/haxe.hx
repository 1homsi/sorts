class BubbleSort {
    static function bubbleSort(arr:Array<Int>):Array<Int> {
        var n = arr.length;
        var swapped:Bool;
        do {
            swapped = false;
            for (i in 0...n-1) {
                if (arr[i] > arr[i+1]) {
                    var tmp = arr[i];
                    arr[i] = arr[i+1];
                    arr[i+1] = tmp;
                    swapped = true;
                }
            }
            n--;
        } while (swapped);
        return arr;
    }

    static function main() {
        var arr = [64, 34, 25, 12, 22, 11, 90];
        trace(bubbleSort(arr));
    }
}
