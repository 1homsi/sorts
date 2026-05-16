<?hh
function quicksort(vec<int> $arr): vec<int> {
  if (count($arr) <= 1) return $arr;
  $pivot = $arr[0];
  $less = vec[];
  $greater = vec[];
  for ($i = 1; $i < count($arr); $i++) {
    if ($arr[$i] <= $pivot) {
      $less[] = $arr[$i];
    } else {
      $greater[] = $arr[$i];
    }
  }
  return vec(...quicksort($less), $pivot, ...quicksort($greater));
}

$result = quicksort(vec(5, 2, 8, 1, 9, 3));
var_dump($result);