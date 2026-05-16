<?hh
function stoogesort(inout array<int> $a, int $i, int $j): void {
  if ($a[$j] < $a[$i]) {
    $temp = $a[$j];
    $a[$j] = $a[$i];
    $a[$i] = $temp;
  }
  if ($j - $i > 1) {
    $t = intval(($j - $i + 1) / 3);
    stoogesort($a, $i, $j - $t);
    stoogesort($a, $i + $t, $j);
    stoogesort($a, $i, $j - $t);
  }
}

$arr = vec[5, 2, 8, 1, 9, 3];
stoogesort($arr, 0, 5);
print_r($arr);
