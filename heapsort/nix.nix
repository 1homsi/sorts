let
  heapify = arr: n: i:
    let
      left = 2 * i + 1;
      right = 2 * i + 2;
      largest0 = if left < n && builtins.elemAt arr left > builtins.elemAt arr i then left else i;
      largest = if right < n && builtins.elemAt arr right > builtins.elemAt arr largest0 then right else largest0;
      vi = builtins.elemAt arr i;
      vl = builtins.elemAt arr largest;
      arr2 = builtins.genList (k: if k == i then vl else if k == largest then vi else builtins.elemAt arr k) (builtins.length arr);
    in
      if largest != i then heapify arr2 n largest else arr;

  heapsort = arr:
    let
      n = builtins.length arr;
      indices = builtins.genList (k: n / 2 - 1 - k) (n / 2);
      heap = builtins.foldl' (a: i: heapify a n i) arr indices;
      sortIndices = builtins.genList (k: n - 1 - k) (n - 1);
      swap = a: i:
        let v0 = builtins.elemAt a 0; vi = builtins.elemAt a i;
            a2 = builtins.genList (k: if k == 0 then vi else if k == i then v0 else builtins.elemAt a k) n;
        in heapify a2 i 0;
    in builtins.foldl' swap heap sortIndices;

in heapsort [12 11 13 5 6 7]
