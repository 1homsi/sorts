def quicksort: lst {
  lst size <= 1 if_true: { return: lst }
  pivot = lst at: (lst size / 2)
  left = lst select: |x| { x < pivot }
  middle = lst select: |x| { x == pivot }
  right = lst select: |x| { x > pivot }
  (quicksort: left) + middle + (quicksort: right)
}

quicksort: [3, 6, 8, 10, 1, 2, 1] . println
