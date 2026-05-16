using System;

public class GnomeSortSpec {
    public static void GnomeSort(int[] arr)
        requires arr != null;
        ensures forall{int i in (0: arr.Length-1); arr[i] <= arr[i+1]};
    {
        int i = 0;
        int n = arr.Length;
        while (i < n)
            invariant 0 <= i && i <= n;
        {
            if (i == 0 || arr[i] >= arr[i - 1]) {
                i++;
            } else {
                int tmp = arr[i];
                arr[i] = arr[i - 1];
                arr[i - 1] = tmp;
                i--;
            }
        }
    }
}
