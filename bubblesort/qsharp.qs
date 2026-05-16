namespace BubbleSort {
  operation BubbleSort(arr : Int[]): Int[] {
    mutable result = arr;
    let n = Length(arr);
    for i in 0..n-1 {
      for j in 0..n-2-i {
        if result[j] > result[j+1] {
          let temp = result[j];
          set result w/= j <- result[j+1];
          set result w/= j+1 <- temp;
        }
      }
    }
    return result;
  }
  
  @EntryPoint()
  operation Main(): Unit {
    let sorted = BubbleSort([5, 2, 8, 1, 9, 3]);
    Message("Sorted: {}");
  }
}