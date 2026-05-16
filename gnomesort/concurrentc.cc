void gnomesort(int arr[], int len) {
  int i = 0;
  int temp;

  while (i < len) {
    if (i == 0) {
      i++;
    } else if (arr[i] < arr[i - 1]) {
      temp = arr[i];
      arr[i] = arr[i - 1];
      arr[i - 1] = temp;
      i--;
    } else {
      i++;
    }
  }
}

void main() {
  int test[] = {5, 2, 8, 1, 9, 3};
  gnomesort(test, 6);

  process print_results() {
    for (int j = 0; j < 6; j++) {
      printf("%d ", test[j]);
    }
  }

  print_results();
}
