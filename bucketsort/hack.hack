function bucketSort(arr: vec<int>, maxVal: int): vec<int> {
  if (maxVal === 0) return $arr;
  $buckets = vec[];
  for ($i = 0; $i < $maxVal; $i++) {
    $buckets[] = vec[];
  }
  foreach ($arr as $num) {
    $idx = (int)($num);
    $buckets[$idx][] = $num;
  }
  $result = vec[];
  for ($i = 0; $i < $maxVal; $i++) {
    foreach ($buckets[$i] as $num) {
      $result[] = $num;
    }
  }
  return $result;
}
$sorted = bucketSort(vec[5, 2, 8, 1, 9, 3], 10);
var_dump($sorted);