func gnomesort(arr) {
  i = 0;
  while (i < numberof(arr)) {
    if (i == 0) {
      i++;
    } else if (arr(i) < arr(i-1)) {
      temp = arr(i);
      arr(i) = arr(i-1);
      arr(i-1) = temp;
      i--;
    } else {
      i++;
    }
  }
  return arr;
}

test = [5, 2, 8, 1, 9, 3];
print, gnomesort(test);
