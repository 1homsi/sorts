function insertionSort(array<int> &$arr): void {
  $n = count($arr);
  for ($i = 1; $i < $n; $i++) {
    $key = $arr[$i];
    $j = $i - 1;
    while ($j >= 0 && $arr[$j] > $key) {
      $arr[$j + 1] = $arr[$j];
      $j--;
    }
    $arr[$j + 1] = $key;
  }
}

$arr = vec[5, 2, 8, 1, 9, 3];
insertionSort(inout $arr);
var_dump($arr);