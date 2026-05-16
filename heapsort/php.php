<?php
function heapify(&$arr, $n, $i) {
    $largest = $i;
    $left = 2 * $i + 1;
    $right = 2 * $i + 2;
    if ($left < $n && $arr[$left] > $arr[$largest]) $largest = $left;
    if ($right < $n && $arr[$right] > $arr[$largest]) $largest = $right;
    if ($largest !== $i) {
        [$arr[$i], $arr[$largest]] = [$arr[$largest], $arr[$i]];
        heapify($arr, $n, $largest);
    }
}

function heapsort(&$arr) {
    $n = count($arr);
    for ($i = intdiv($n, 2) - 1; $i >= 0; $i--) heapify($arr, $n, $i);
    for ($i = $n - 1; $i > 0; $i--) {
        [$arr[0], $arr[$i]] = [$arr[$i], $arr[0]];
        heapify($arr, $i, 0);
    }
}

$arr = [12, 11, 13, 5, 6, 7];
heapsort($arr);
echo implode(" ", $arr) . "\n";
