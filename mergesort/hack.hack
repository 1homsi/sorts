<?hh
function merge(inout array<int> $arr, int $left, int $mid, int $right): void {
  $i = $left;
  $j = $mid + 1;
  $result = array();
  
  while ($i <= $mid && $j <= $right) {
    if ($arr[$i] <= $arr[$j]) {
      $result[] = $arr[$i];
      $i++;
    } else {
      $result[] = $arr[$j];
      $j++;
    }
  }
  
  while ($i <= $mid) {
    $result[] = $arr[$i];
    $i++;
  }
  
  while ($j <= $right) {
    $result[] = $arr[$j];
    $j++;
  }
  
  for ($k = $left; $k <= $right; $k++) {
    $arr[$k] = $result[$k - $left];
  }
}

function mergesort(inout array<int> $arr, int $left, int $right): void {
  if ($left < $right) {
    $mid = intval(($left + $right) / 2);
    mergesort($arr, $left, $mid);
    mergesort($arr, $mid + 1, $right);
    merge($arr, $left, $mid, $right);
  }
}

$arr = array(5, 2, 8, 1, 9, 3);
mergesort($arr, 0, 5);
var_dump($arr);
