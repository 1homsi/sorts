insertionSort(n, ar) = ar : par(i, n, _)
  with {
    process = loop(1, ar) 
      with {
        loop(i, a) = a,
          (i < n) : (loop(i+1, inserted(i, a, key(i, a))))
          ~ (i >= n) : (a);
        key(i, a) = a : select(i);
        inserted(i, a, k) = insertPos(0, i, k, a)
          with {
            insertPos(j, i, k, a) = a,
              (j < i & a : select(j) > k) : 
              (insertPos(j+1, i, k, shiftLeft(j, a)))
              ~ (a);
          };
      };
  };