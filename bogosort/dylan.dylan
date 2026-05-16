Module: bogosort

define function is-sorted(arr :: <vector>) => (sorted? :: <boolean>)
  block (return)
    for (i from 0 below size(arr) - 1)
      if (arr[i] > arr[i + 1])
        return(#f)
      end if;
    end for;
    #t
  end block
end function;

define function shuffle(arr :: <vector>) => (shuffled :: <vector>)
  let n = size(arr);
  let a = copy-sequence(arr);
  for (i from n - 1 to 1 by -1)
    let j = random(i + 1);
    let tmp = a[i];
    a[i] := a[j];
    a[j] := tmp;
  end for;
  a
end function;

define function bogosort(arr :: <vector>) => (sorted :: <vector>)
  let a = copy-sequence(arr);
  while (~is-sorted(a))
    a := shuffle(a);
  end while;
  a
end function;

define method main() => ()
  let arr = vector(3, 1, 4, 1, 5, 9, 2, 6);
  format-out("%=\n", bogosort(arr));
end method;

main();
