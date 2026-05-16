namespace StoogeSort {
  operation StoogeSort(arr : Int[], i : Int, j : Int) : Int[] {
    mutable result = arr;
    if (result[j] < result[i]) {
      let temp = result[j];
      set result w/= j <- result[i];
      set result w/= i <- temp;
    }
    if (j - i > 1) {
      let t = (j - i + 1) / 3;
      set result = StoogeSort(result, i, j - t);
      set result = StoogeSort(result, i + t, j);
      set result = StoogeSort(result, i, j - t);
    }
    return result;
  }
  
  @EntryPoint()
  operation Main() : Unit {
    let arr = [5, 2, 8, 1, 9, 3];
    let sorted = StoogeSort(arr, 0, 5);
    Message($"{sorted}");
  }
}
