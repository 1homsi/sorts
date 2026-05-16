module: mergesort

define function merge(left :: <list>, right :: <list>) => (result :: <list>)
  if (empty?(left)) right
  elseif (empty?(right)) left
  elseif (head(left) <= head(right))
    pair(head(left), merge(tail(left), right))
  else
    pair(head(right), merge(left, tail(right)))
  end if
end function;

define function merge-sort(lst :: <list>) => (result :: <list>)
  let n = size(lst);
  if (n <= 1)
    lst
  else
    let mid = floor/(n, 2);
    let left = copy-sequence(lst, end: mid);
    let right = copy-sequence(lst, start: mid);
    merge(merge-sort(left), merge-sort(right))
  end if
end function;

let arr = list(38, 27, 43, 3, 9, 82, 10);
format-out("%=\n", merge-sort(arr));
