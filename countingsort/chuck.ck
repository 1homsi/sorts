fun int[] countingsort(int arr[]) {
  if (arr.cap() == 0) return arr;

  int max, i, j;
  max = 0;
  for (0 => i; i < arr.cap(); i++) {
    if (arr[i] > max) max = arr[i];
  }

  int count[max + 1];
  for (0 => i; i <= max; i++) {
    0 => count[i];
  }

  for (0 => i; i < arr.cap(); i++) {
    count[arr[i]]++;
  }

  int output[0];
  for (0 => i; i <= max; i++) {
    for (0 => j; j < count[i]; j++) {
      output << i;
    }
  }

  return output;
}

int test[6];
5 => test[0]; 2 => test[1]; 8 => test[2];
1 => test[3]; 9 => test[4]; 3 => test[5];
countingsort(test) @=> test;
<< test >> chout;
