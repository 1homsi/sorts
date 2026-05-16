fun selection-sort(arr):
  n = array-length(arr)
  for each(i from range(0, n)):
    min-idx = ref i
    for each(j from range(i + 1, n)):
      when array-get(arr, j) < array-get(arr, ^min-idx):
        min-idx := j
      end
    end
    tmp = array-get(arr, i)
    array-set(arr, i, array-get(arr, ^min-idx))
    array-set(arr, ^min-idx, tmp)
  end
  arr
end
