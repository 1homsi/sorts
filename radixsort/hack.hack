<?hh
function radixsort(array<int> $arr): array<int> {
  $max = max($arr);
  $exp = 1;
  while ($max / $exp > 0) {
    $arr = countingSortByExp($arr, $exp);
    $exp *= 10;
  }
  return $arr;
}

function countingSortByExp(array<int> $arr, int $exp): array<int> {
  $n = count($arr);
  $output = array_fill(0, $n, 0);
  $count = array_fill(0, 10, 0);
  for ($i = 0; $i < $n; $i++) {
    $count[intdiv($arr[$i], $exp) % 10]++;
  }
  for ($i = 1; $i < 10; $i++) {
    $count[$i] += $count[$i - 1];
  }
  for ($i = $n - 1; $i >= 0; $i--) {
    $output[$count[intdiv($arr[$i], $exp) % 10] - 1] = $arr[$i];
    $count[intdiv($arr[$i], $exp) % 10]--;
  }
  return $output;
}

$result = radixsort(vec[5, 2, 8, 1, 9, 3]);
var_dump($result);
