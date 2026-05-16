func countingsort(arr) {
  max_val = max(arr);
  count = array(0, max_val + 1);
  count(*) = 0;

  for (i = 1; i <= numberof(arr); i++) {
    count(arr(i) + 1) += 1;
  }

  output = [];
  for (i = 0; i <= max_val; i++) {
    for (j = 0; j < count(i + 1); j++) {
      output = [output, i];
    }
  }

  return output;
}

arr = [5, 2, 8, 1, 9, 3];
result = countingsort(arr);
print, result;
