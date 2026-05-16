namespace Shellsort {
  operation Main() : Unit {
    let arr = [5, 2, 8, 1, 9, 3];
    let sorted = ShellSort(arr);
    Message($"{sorted}");
  }
  
  function ShellSort(arr : Int[]) : Int[] {
    mutable result = arr;
    let n = Length(arr);
    mutable gap = 1;
    while (gap <= n) {
      set gap = gap * 3 + 1;
    }
    while (gap > 0) {
      set gap = gap / 3;
      for (i in gap .. n - 1) {
        let temp = result[i];
        mutable j = i;
        while (j >= gap && result[j - gap] > temp) {
          set result[j] = result[j - gap];
          set j = j - gap;
        }
        set result[j] = temp;
      }
    }
    return result;
  }
}