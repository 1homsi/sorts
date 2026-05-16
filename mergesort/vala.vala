int[] merge(int[] left, int[] right) {
    int[] result = new int[left.length + right.length];
    int i = 0, j = 0, k = 0;
    while (i < left.length && j < right.length) {
        if (left[i] <= right[j]) result[k++] = left[i++];
        else result[k++] = right[j++];
    }
    while (i < left.length) result[k++] = left[i++];
    while (j < right.length) result[k++] = right[j++];
    return result;
}

int[] merge_sort(int[] arr) {
    if (arr.length <= 1) return arr;
    int mid = arr.length / 2;
    int[] left = merge_sort(arr[0:mid]);
    int[] right = merge_sort(arr[mid:arr.length]);
    return merge(left, right);
}

void main() {
    int[] arr = {38, 27, 43, 3, 9, 82, 10};
    int[] sorted = merge_sort(arr);
    foreach (int v in sorted) stdout.printf("%d ", v);
    stdout.printf("\n");
}
