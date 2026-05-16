fun void bitonicsort(int arr[], int lo, int cnt, int dir)
{
    if (cnt > 1)
    {
        int k;
        k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
}

fun void bitonicmerge(int arr[], int lo, int cnt, int dir)
{
    if (cnt > 1)
    {
        int k;
        k = cnt / 2;
        for (int i = lo; i < lo + cnt - k; i++)
        {
            if ((arr[i] > arr[i + k]) == (dir == 1))
            {
                int tmp;
                tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
}

int arr[8];
arr[0] = 5; arr[1] = 2; arr[2] = 8; arr[3] = 1;
arr[4] = 9; arr[5] = 3; arr[6] = 7; arr[7] = 4;
bitonicsort(arr, 0, 8, 1);

for (int i = 0; i < 8; i++)
{
    <<< arr[i] >>>;
}
