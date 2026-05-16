<?hh

function gnomesort(vec<int> $arr): vec<int> {
  $i = 0;
  while ($i < count($arr)) {
    if ($i === 0) {
      $i++;
    } else if ($arr[$i] < $arr[$i - 1]) {
      $temp = $arr[$i];
      $arr[$i] = $arr[$i - 1];
      $arr[$i - 1] = $temp;
      $i--;
    } else {
      $i++;
    }
  }
  return $arr;
}

$test = vec[5, 2, 8, 1, 9, 3];
$sorted = gnomesort($test);
var_dump($sorted);
