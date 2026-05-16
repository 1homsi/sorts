<?hh
function bitonicsort(inout $arr, $lo, $cnt, $dir): void {
  if ($cnt > 1) {
    $k = (int)($cnt / 2);
    bitonicsort(inout $arr, $lo, $k, 1);
    bitonicsort(inout $arr, $lo + $k, $k, 0);
    bitonicmerge(inout $arr, $lo, $cnt, $dir);
  }
}

function bitonicmerge(inout $arr, $lo, $cnt, $dir): void {
  if ($cnt > 1) {
    $k = (int)($cnt / 2);
    for ($i = $lo; $i < $lo + $cnt - $k; $i++) {
      if (($arr[$i] > $arr[$i + $k]) == ($dir == 1)) {
        $tmp = $arr[$i];
        $arr[$i] = $arr[$i + $k];
        $arr[$i + $k] = $tmp;
      }
    }
    bitonicmerge(inout $arr, $lo, $k, $dir);
    bitonicmerge(inout $arr, $lo + $k, $k, $dir);
  }
}

function main(): void {
  $arr = vec[5, 2, 8, 1, 9, 3, 7, 4];
  bitonicsort(inout $arr, 0, count($arr), 1);
  echo implode(", ", $arr) . "
";
}

main();
