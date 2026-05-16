define(`COMB_SORT_DESC', `Comb sort: start with gap=n, reduce by 1.3 each pass')dnl
define(`NEW_GAP', `eval(ifelse(eval($1 * 10 / 13 < 1), 1, 1, eval($1 * 10 / 13)))')dnl
define(`COMB_SORT_PSEUDOCODE', `
procedure comb_sort(arr, n):
  gap = n
  sorted = false
  while not sorted:
    gap = max(1, floor(gap / 1.3))
    sorted = (gap == 1)
    for i = 0 to n-gap-1:
      if arr[i] > arr[i+gap]:
        swap(arr[i], arr[i+gap])
        sorted = false
')dnl
COMB_SORT_PSEUDOCODE
