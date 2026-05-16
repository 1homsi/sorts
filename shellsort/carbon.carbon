package ShellSort api;

fn ShellSort(arr: [i32; 7]) -> [i32; 7] {
  var a: [i32; 7] = arr;
  var n: i32 = 7;
  var gap: i32 = n / 2;
  while gap > 0 {
    var i: i32 = gap;
    while i < n {
      var temp: i32 = a[i];
      var j: i32 = i;
      while j >= gap and a[j - gap] > temp {
        a[j] = a[j - gap];
        j = j - gap;
      }
      a[j] = temp;
      i = i + 1;
    }
    gap = gap / 2;
  }
  return a;
}
