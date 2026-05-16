<?hh
function bubblesort(vec<int> $arr): vec<int> {
  $n = count($arr);
  for ($i = 0; $i < $n; $i++) {
    for ($j = 0; $j < $n - 1 - $i; $j++) {
      if ($arr[$j] > $arr[$j + 1]) {
        $temp = $arr[$j];
        $arr[$j] = $arr[$j + 1];
        $arr[$j + 1] = $temp;
      }
    }
  }
  return $arr;
}

$result = bubblesort(vec[5, 2, 8, 1, 9, 3]);
var_dump($result);