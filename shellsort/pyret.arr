fun shell-sort(lst):
  arr = array-from-list(lst)
  n = array-length(arr)
  gap = ref(num-floor(n / 2))
  while not(^gap == 0):
    i = ref(^gap)
    while not(^i >= n):
      temp = array-get(arr, ^i)
      j = ref(^i)
      while (^j >= ^gap) and (array-get(arr, ^j - ^gap) > temp):
        array-set(arr, ^j, array-get(arr, ^j - ^gap))
        j := ^j - ^gap
      end
      array-set(arr, ^j, temp)
      i := ^i + 1
    end
    gap := num-floor(^gap / 2)
  end
  array-to-list(arr)
end

result = shell-sort([list: 64, 34, 25, 12, 22, 11, 90])
print(result)
