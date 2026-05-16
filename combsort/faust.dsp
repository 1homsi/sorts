declare name "CombSort";

process = 0;

comb_sort(arr, len) = arr
  with {
    gap = len;
    gap = select2(gap > 1, 1, int((gap * 10) / 13));
  };

main = 5, 2, 8, 1, 9, 3 : comb_sort(6);
