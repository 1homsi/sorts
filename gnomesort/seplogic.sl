procedure gnomeSort(arr: int[], n: int)
  requires: array(arr, 0, n, _)
  ensures: sorted_array(arr, 0, n)
{
    int i = 0;
    while (i < n)
        inv: 0 <= i <= n * array(arr, 0, n, _)
    {
        if (i == 0 || arr[i] >= arr[i-1]) {
            i++;
        } else {
            int tmp = arr[i];
            arr[i] = arr[i-1];
            arr[i-1] = tmp;
            i--;
        }
    }
}
