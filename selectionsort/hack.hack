<?hh
function selection_sort(vec<int> $arr): vec<int> {
  $n = count($arr);
  for ($i = 0; $i < $n - 1; $i++) {
    $min_idx = $i;
    for ($j = $i + 1; $j < $n; $j++) {
      if ($arr[$j] < $arr[$min_idx]) {
        $min_idx = $j;
      }
    }
    $tmp = $arr[$i];
    $arr[$i] = $arr[$min_idx];
    $arr[$min_idx] = $tmp;
  }
  return $arr;
}

$result = selection_sort(vec[5, 2, 8, 1, 9, 3]);
var_dump($result);