fun int[] quicksort(int arr[]) {
  if (arr.cap() <= 1)
    return arr;

  int pivot = arr[0];
  int less[0];
  int greater[0];

  for (1 => int i; i < arr.cap(); i++) {
    if (arr[i] <= pivot)
      less << arr[i];
    else
      greater << arr[i];
  }

  int result[];
  quicksort(less) @=> int[] sl;
  quicksort(greater) @=> int[] sg;
  for (0 => int i; i < sl.cap(); i++)
    result << sl[i];
  result << pivot;
  for (0 => int i; i < sg.cap(); i++)
    result << sg[i];
  return result;
}

int arr[6];
arr[0] = 5; arr[1] = 2; arr[2] = 8;
arr[3] = 1; arr[4] = 9; arr[5] = 3;
quicksort(arr) @=> int result[];
for (int x : result)
  <<< x >>>;