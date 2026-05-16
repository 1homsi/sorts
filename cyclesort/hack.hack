function cycleSort(array<int> $arr): array<int> {
  $n = count($arr);
  for ($pos = 0; $pos < $n; $pos++) {
    $item = $arr[$pos];
    $cycles = 0;
    for ($i = 0; $i < $n; $i++) {
      if ($i !== $pos && $arr[$i] < $item) {
        $cycles++;
      }
    }
    if ($cycles === 0) continue;
    while ($arr[$pos] === $item) {
      $pos++;
    }
    $temp = $arr[$pos];
    $arr[$pos] = $item;
    $item = $temp;
    while ($cycles > 0) {
      $cycles = 0;
      for ($i = 0; $i < $n; $i++) {
        if ($i !== $pos && $arr[$i] < $item) {
          $cycles++;
        }
      }
      while ($arr[$pos] === $item) {
        $pos++;
      }
      $temp = $arr[$pos];
      $arr[$pos] = $item;
      $item = $temp;
      $cycles--;
    }
  }
  return $arr;
}

$result = cycleSort(vec(5, 2, 8, 1, 9, 3));
var_dump($result);
