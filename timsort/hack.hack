<?hh
function timsort(vec<int> $arr, int $minSize = 32): vec<int> {
  return mergesort($arr, $minSize);
}

function mergesort(vec<int> $arr, int $minSize): vec<int> {
  if (count($arr) <= 1) {
    return $arr;
  }
  if (count($arr) <= $minSize) {
    return insertionsort($arr);
  }
  
  $mid = intval(count($arr) / 2);
  $left = array_slice($arr, 0, $mid);
  $right = array_slice($arr, $mid);
  
  return merge(mergesort($left, $minSize), mergesort($right, $minSize));
}

function insertionsort(vec<int> $arr): vec<int> {
  $result = $arr;
  for ($i = 1; $i < count($result); $i++) {
    $key = $result[$i];
    $j = $i - 1;
    while ($j >= 0 && $result[$j] > $key) {
      $result[$j + 1] = $result[$j];
      $j--;
    }
    $result[$j + 1] = $key;
  }
  return $result;
}

function merge(vec<int> $left, vec<int> $right): vec<int> {
  $result = vec[];
  $i = 0;
  $j = 0;
  
  while ($i < count($left) && $j < count($right)) {
    if ($left[$i] <= $right[$j]) {
      $result[] = $left[$i];
      $i++;
    } else {
      $result[] = $right[$j];
      $j++;
    }
  }
  
  while ($i < count($left)) {
    $result[] = $left[$i];
    $i++;
  }
  while ($j < count($right)) {
    $result[] = $right[$j];
    $j++;
  }
  
  return $result;
}

$arr = vec[5, 2, 8, 1, 9, 3];
$sorted = timsort($arr);
echo implode(", ", $sorted) . "\n";
