operation InsertionSort(arr : Int[]) : Int[] {
  let n = Length(arr);
  mutable result = arr;
  for i in 1..n-1 {
    let key = result[i];
    mutable j = i - 1;
    while j >= 0 and result[j] > key {
      set result[j + 1] = result[j];
      set j = j - 1;
    }
    set result[j + 1] = key;
  }
  return result;
}

Message($"{InsertionSort([5, 2, 8, 1, 9, 3])}");
return ();