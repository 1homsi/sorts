<?hh

function countingsort(vec<int> $arr): vec<int> {
  $max = 0;
  foreach ($arr as $val) {
    if ($val > $max) {
      $max = $val;
    }
  }

  $count = vec_fill($max + 1, 0);
  foreach ($arr as $val) {
    $count[$val]++;
  }

  $output = vec[];
  for ($i = 0; $i <= $max; $i++) {
    for ($j = 0; $j < $count[$i]; $j++) {
      $output[] = $i;
    }
  }

  return $output;
}

$test = vec[5, 2, 8, 1, 9, 3];
var_dump(countingsort($test));
