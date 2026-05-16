import std.stdio;

int[] mergeSort(int[] arr) {
    if (arr.length <= 1) return arr;
    size_t mid = arr.length / 2;
    int[] left = mergeSort(arr[0..mid]);
    int[] right = mergeSort(arr[mid..$]);
    return merge(left, right);
}

int[] merge(int[] left, int[] right) {
    int[] result;
    size_t i = 0, j = 0;
    while (i < left.length && j < right.length) {
        if (left[i] <= right[j]) result ~= left[i++];
        else result ~= right[j++];
    }
    result ~= left[i..$];
    result ~= right[j..$];
    return result;
}

void main() {
    int[] arr = [38, 27, 43, 3, 9, 82, 10];
    writeln(mergeSort(arr));
}
