public void BitonicSort(int[] arr, int lo, int cnt, int dir)
{
    if (cnt > 1)
    {
        int k = cnt / 2;
        BitonicSort(arr, lo, k, 1);
        BitonicSort(arr, lo + k, k, 0);
        BitonicMerge(arr, lo, cnt, dir);
    }
}

public void BitonicMerge(int[] arr, int lo, int cnt, int dir)
{
    if (cnt > 1)
    {
        int k = cnt / 2;
        for (int i = lo; i < lo + cnt - k; i++)
        {
            if ((arr[i] > arr[i + k]) == (dir == 1))
            {
                int tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        BitonicMerge(arr, lo, k, dir);
        BitonicMerge(arr, lo + k, k, dir);
    }
}

public void main()
{
    int arr[8] = { 5, 2, 8, 1, 9, 3, 7, 4 };
    BitonicSort(arr, 0, 8, 1);
    PrintArray(arr, 8);
}

void PrintArray(int[] arr, int len)
{
    for (int i = 0; i < len; i++)
        PrintToChat(null, "%d ", arr[i]);
}
