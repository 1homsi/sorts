def insertion_sort(arr):
  match arr:
    case List/Nil:
      return List/Nil
    case List/Cons:
      return insert(arr.head, insertion_sort(arr.tail))

def insert(x, arr):
  match arr:
    case List/Nil:
      return List/Cons { head: x, tail: List/Nil }
    case List/Cons:
      if x <= arr.head:
        return List/Cons { head: x, tail: arr }
      else:
        return List/Cons { head: arr.head, tail: insert(x, arr.tail) }
