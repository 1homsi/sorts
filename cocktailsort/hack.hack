<?hh
function cocktailsort(inout vec<int> $arr): void {
  $n = count($arr);
  $i = 0;
  while ($i < $n) {
    $swapped = false;
    for ($k = 0; $k < $n - $i - 1; $k++) {
      if ($arr[$k] > $arr[$k + 1]) {
        $temp = $arr[$k];
        $arr[$k] = $arr[$k + 1];
        $arr[$k + 1] = $temp;
        $swapped = true;
      }
    }
    if (!$swapped) break;
    $i++;
    $swapped = false;
    for ($k = $n - $i - 2; $k >= 0; $k--) {
      if ($arr[$k] > $arr[$k + 1]) {
        $temp = $arr[$k];
        $arr[$k] = $arr[$k + 1];
        $arr[$k + 1] = $temp;
        $swapped = true;
      }
    }
    if (!$swapped) break;
    $i++;
  }
}

$arr = vec[5, 2, 8, 1, 9, 3];
cocktailsort($arr);
echo "Sorted: ";
foreach ($arr as $v) echo $v . " ";
echo "\n";
