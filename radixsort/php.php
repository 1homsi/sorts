<?php
function countingSort(array &$arr, int $exp): void {
    $n = count($arr);
    $output = array_fill(0, $n, 0);
    $count = array_fill(0, 10, 0);
    for ($i = 0; $i < $n; $i++) $count[intdiv($arr[$i], $exp) % 10]++;
    for ($i = 1; $i < 10; $i++) $count[$i] += $count[$i - 1];
    for ($i = $n - 1; $i >= 0; $i--) {
        $idx = intdiv($arr[$i], $exp) % 10;
        $output[--$count[$idx]] = $arr[$i];
    }
    $arr = $output;
}

function radixSort(array &$arr): void {
    if (empty($arr)) return;
    $max = max($arr);
    for ($exp = 1; intdiv($max, $exp) > 0; $exp *= 10) countingSort($arr, $exp);
}

$arr = [170, 45, 75, 90, 802, 24, 2, 66];
radixSort($arr);
echo implode(', ', $arr) . PHP_EOL;
