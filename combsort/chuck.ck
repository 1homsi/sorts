fun void combSort(int arr[]) {
  int gap = arr.cap();
  true => int swapped;
  while (gap > 1 || swapped) {
    (gap * 10 / 13) => gap;
    if (gap < 1) 1 => gap;
    false => swapped;
    for (0 => int i; i < arr.cap() - gap; i++) {
      if (arr[i] > arr[i + gap]) {
        arr[i] => int temp;
        arr[i + gap] => arr[i];
        temp => arr[i + gap];
        true => swapped;
      }
    }
  }
}

int sample[6];
5 => sample[0];
2 => sample[1];
8 => sample[2];
1 => sample[3];
9 => sample[4];
3 => sample[5];
combSort(sample);
for (0 => int i; i < 6; i++) {
  sample[i] => int x;
  <<< x >>>;
}
