module quicksort;
import std::io;

fn int partition(int[] arr, int low, int high)
{
    int pivot = arr[high];
    int i = low;
    for (int j = low; j < high; j++)
    {
        if (arr[j] <= pivot)
        {
            int tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
            i++;
        }
    }
    int tmp = arr[i]; arr[i] = arr[high]; arr[high] = tmp;
    return i;
}

fn void quicksort(int[] arr, int low, int high)
{
    if (low < high)
    {
        int p = partition(arr, low, high);
        quicksort(arr, low, p - 1);
        quicksort(arr, p + 1, high);
    }
}

fn void main()
{
    int[7] arr = {3, 6, 8, 10, 1, 2, 1};
    quicksort(arr[:], 0, 6);
    io::printn(arr);
}
