#include <stdio.h>
#include <stdlib.h>

process countingsort(int *arr, int len, int *output, int *out_len);
{
  int max = 0, i, j, *count;

  for (i = 0; i < len; i++) {
    if (arr[i] > max) max = arr[i];
  }

  count = (int *)malloc((max + 1) * sizeof(int));
  for (i = 0; i <= max; i++) count[i] = 0;

  for (i = 0; i < len; i++) {
    count[arr[i]]++;
  }

  *out_len = 0;
  for (i = 0; i <= max; i++) {
    for (j = 0; j < count[i]; j++) {
      output[*out_len] = i;
      (*out_len)++;
    }
  }

  free(count);
}

void main() {
  int arr[] = {5, 2, 8, 1, 9, 3};
  int output[6];
  int len = 0;

  countingsort(arr, 6, output, &len);
  for (int i = 0; i < len; i++) {
    printf("%d ", output[i]);
  }
  printf("\n");
}
