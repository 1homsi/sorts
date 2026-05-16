<?hh
function shellsort(vec<int> $arr): vec<int> {
  $n = count($arr);
  $gap = 1;
  while ($gap <= $n) {
    $gap = $gap * 3 + 1;
  }
  while ($gap > 0) {
    $gap = (int)($gap / 3);
    for ($i = $gap; $i < $n; $i++) {
      $temp = $arr[$i];
      $j = $i;
      while ($j >= $gap && $arr[$j - $gap] > $temp) {
        $arr[$j] = $arr[$j - $gap];
        $j -= $gap;
      }
      $arr[$j] = $temp;
    }
  }
  return $arr;
}
$result = shellsort(vec[5, 2, 8, 1, 9, 3]);
var_dump($result);
