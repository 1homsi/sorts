<?hh
function bogosort(vec<int> $arr): vec<int> {
  while (!is_sorted($arr)) {
    shuffle($arr);
  }
  return $arr;
}

function is_sorted(vec<int> $arr): bool {
  for ($i = 0; $i < count($arr) - 1; $i++) {
    if ($arr[$i] > $arr[$i + 1]) {
      return false;
    }
  }
  return true;
}

function shuffle(inout vec<int> $arr): void {
  $n = count($arr);
  for ($i = 0; $i < $n; $i++) {
    $j = rand(0, $n - 1);
    $tmp = $arr[$i];
    $arr[$i] = $arr[$j];
    $arr[$j] = $tmp;
  }
}

$arr = vec[3, 1, 2];
$sorted = bogosort($arr);
print_r($sorted);
