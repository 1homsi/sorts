import lists as L
import random as R

fun is-sorted(arr :: List<Number>) -> Boolean:
  cases (List) arr:
    | empty => true
    | link(_, rest) =>
      cases (List) rest:
        | empty => true
        | link(b, _) =>
          (arr.first <= b) and is-sorted(rest)
      end
  end
end

fun shuffle(arr :: List<Number>) -> List<Number>:
  arr.sort-by(lam(_, _): R.random() < 0.5 end)
end

fun bogosort(arr :: List<Number>) -> List<Number>:
  if is-sorted(arr):
    arr
  else:
    bogosort(shuffle(arr))
  end
end

arr = [list: 3, 1, 4, 1, 5, 9, 2, 6]
print(bogosort(arr))
