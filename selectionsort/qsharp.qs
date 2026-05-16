namespace SelectionSort {
  open Microsoft.Quantum.Intrinsic;
  
  operation SelectionSort(arr : Int[]) : Int[] {
    mutable result = arr;
    let n = Length(arr);
    for i in 0..n-2 {
      mutable min_idx = i;
      for j in i+1..n-1 {
        if result[j] < result[min_idx] {
          set min_idx = j;
        }
      }
      let tmp = result[i];
      set result[i] = result[min_idx];
      set result[min_idx] = tmp;
    }
    return result;
  }
}