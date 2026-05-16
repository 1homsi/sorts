void setup() {
  size(100, 100);
  int[] test = {5, 2, 8, 1, 9, 3};
  int[] result = countingsort(test);
  println(result);
}

int[] countingsort(int[] arr) {
  if (arr.length == 0) return arr;

  int max = 0;
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] > max) max = arr[i];
  }

  int[] count = new int[max + 1];
  for (int i = 0; i < arr.length; i++) {
    count[arr[i]]++;
  }

  int[] output = new int[0];
  for (int i = 0; i <= max; i++) {
    for (int j = 0; j < count[i]; j++) {
      output = append(output, i);
    }
  }

  return output;
}
