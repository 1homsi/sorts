(
{
    var heapsort = {|arr|
        var n = arr.size;
        var i;
        for (i = (n / 2).asInteger - 1; i >= 0; i = i - 1) {
            arr = this.siftDown(arr, i, n);
        };
        for (i = n - 1; i > 0; i = i - 1) {
            var temp = arr[0];
            arr[0] = arr[i];
            arr[i] = temp;
            arr = this.siftDown(arr, 0, i);
        };
        arr
    };

    var siftDown = {|arr, i, n|
        var largest = i;
        var left = (2 * i) + 1;
        var right = (2 * i) + 2;
        if (left < n && arr[left] > arr[largest]) { largest = left };
        if (right < n && arr[right] > arr[largest]) { largest = right };
        if (largest != i) {
            var temp = arr[i];
            arr[i] = arr[largest];
            arr[largest] = temp;
            arr = this.siftDown(arr, largest, n);
        };
        arr
    };

    var result = heapsort.([5, 2, 8, 1, 9, 3]);
    result.postln;
}.call
)
