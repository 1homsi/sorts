<?php

define('MIN_RUN', 32);

function insertionSort(array &$arr, int $left, int $right): void {
    for ($i = $left + 1; $i <= $right; $i++) {
        $key = $arr[$i];
        $j = $i - 1;
        while ($j >= $left && $arr[$j] > $key) {
            $arr[$j + 1] = $arr[$j];
            $j--;
        }
        $arr[$j + 1] = $key;
    }
}

function mergeRuns(array &$arr, int $left, int $mid, int $right): void {
    $lp = array_slice($arr, $left, $mid - $left + 1);
    $rp = array_slice($arr, $mid + 1, $right - $mid);
    $i = 0; $j = 0; $k = $left;
    while ($i < count($lp) && $j < count($rp)) {
        if ($lp[$i] <= $rp[$j]) $arr[$k++] = $lp[$i++];
        else $arr[$k++] = $rp[$j++];
    }
    while ($i < count($lp)) $arr[$k++] = $lp[$i++];
    while ($j < count($rp)) $arr[$k++] = $rp[$j++];
}

function timsort(array &$arr): void {
    $n = count($arr);
    for ($i = 0; $i < $n; $i += MIN_RUN) {
        insertionSort($arr, $i, min($i + MIN_RUN - 1, $n - 1));
    }
    for ($size = MIN_RUN; $size < $n; $size *= 2) {
        for ($left = 0; $left < $n; $left += 2 * $size) {
            $mid = min($left + $size - 1, $n - 1);
            $right = min($left + 2 * $size - 1, $n - 1);
            if ($mid < $right) mergeRuns($arr, $left, $mid, $right);
        }
    }
}

$arr = [5, 2, 8, 1, 9, 3, 7, 4, 6];
timsort($arr);
echo implode(', ', $arr) . "\n";
