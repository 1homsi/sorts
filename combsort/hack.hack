<?hh
function comb_sort(vec<int> $arr): vec<int> {
  $gap = count($arr);
  while ($gap > 1) {
    $gap = (int)($gap / 1.3);
    if ($gap < 1) $gap = 1;
    for ($i = 0; $i < count($arr) - $gap; $i++) {
      if ($arr[$i] > $arr[$i + $gap]) {
        $temp = $arr[$i];
        $arr[$i] = $arr[$i + $gap];
        $arr[$i + $gap] = $temp;
      }
    }
  }
  return $arr;
}

$sample = vec[5, 2, 8, 1, 9, 3];
var_dump(comb_sort($sample));
