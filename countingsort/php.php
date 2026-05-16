<?php
function countingSort(array $arr): array {
    if (empty($arr)) return $arr;
    $min = min($arr);
    $max = max($arr);
    $range = $max - $min + 1;
    $count = array_fill(0, $range, 0);
    foreach ($arr as $v) $count[$v - $min]++;
    for ($i = 1; $i < $range; $i++) $count[$i] += $count[$i - 1];
    $output = array_fill(0, count($arr), 0);
    for ($i = count($arr) - 1; $i >= 0; $i--) {
        $output[--$count[$arr[$i] - $min]] = $arr[$i];
    }
    return $output;
}

print_r(countingSort([4, 2, 2, 8, 3, 3, 1]));
