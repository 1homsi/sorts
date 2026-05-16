module: dylan-user

define function quicksort(lst :: <list>) => (sorted :: <list>)
  if (size(lst) <= 1)
    lst
  else
    let pivot = head(lst);
    let rest = tail(lst);
    let left = choose(method(x) x <= pivot end, rest);
    let right = choose(method(x) x > pivot end, rest);
    concatenate(quicksort(left), list(pivot), quicksort(right))
  end if
end function;

format-out("%=\n", quicksort(list(3, 6, 8, 10, 1, 2, 1)));
