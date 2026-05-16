def quicksort(arr):
  match arr:
    case List/Nil:
      return List/Nil
    case List/Cons:
      pivot = arr.head
      rest = arr.tail
      left = filter_le(rest, pivot)
      right = filter_gt(rest, pivot)
      return List/concat(quicksort(left), List/Cons(pivot, quicksort(right)))

def filter_le(lst, pivot):
  match lst:
    case List/Nil:
      return List/Nil
    case List/Cons:
      if lst.head <= pivot:
        return List/Cons(lst.head, filter_le(lst.tail, pivot))
      else:
        return filter_le(lst.tail, pivot)

def filter_gt(lst, pivot):
  match lst:
    case List/Nil:
      return List/Nil
    case List/Cons:
      if lst.head > pivot:
        return List/Cons(lst.head, filter_gt(lst.tail, pivot))
      else:
        return filter_gt(lst.tail, pivot)

def main():
  arr = [3, 6, 8, 10, 1, 2, 1]
  return quicksort(arr)
