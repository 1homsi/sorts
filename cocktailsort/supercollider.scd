(
CocktailSort {
    *sort { |arr|
        var n = arr.size;
        var i = 0;
        arr = arr.copy;
        while { i < n } {
            var swapped = false;
            (0 .. n - i - 2).do { |k|
                if (arr[k] > arr[k + 1]) {
                    arr.swap(k, k + 1);
                    swapped = true;
                }
            };
            if (swapped.not) { ^arr };
            i = i + 1;
            swapped = false;
            (n - i - 2).downto(0) { |k|
                if (arr[k] > arr[k + 1]) {
                    arr.swap(k, k + 1);
                    swapped = true;
                }
            };
            if (swapped.not) { ^arr };
            i = i + 1;
        };
        ^arr
    }
}

"Sorted: ".post;
CocktailSort.sort([5, 2, 8, 1, 9, 3]).postln;
)
