<?php
function compareAndSwap(array &$arr, int $i, int $j, bool $direction): void {
    if ($direction === ($arr[$i] > $arr[$j])) {
        [$arr[$i], $arr[$j]] = [$arr[$j], $arr[$i]];
    }
}

function bitonicMerge(array &$arr, int $lo, int $cnt, bool $direction): void {
    if ($cnt > 1) {
        $k = intdiv($cnt, 2);
        for ($i = $lo; $i < $lo + $k; $i++) {
            compareAndSwap($arr, $i, $i + $k, $direction);
        }
        bitonicMerge($arr, $lo, $k, $direction);
        bitonicMerge($arr, $lo + $k, $k, $direction);
    }
}

function bitonicSort(array &$arr, int $lo, int $cnt, bool $direction): void {
    if ($cnt > 1) {
        $k = intdiv($cnt, 2);
        bitonicSort($arr, $lo, $k, true);
        bitonicSort($arr, $lo + $k, $k, false);
        bitonicMerge($arr, $lo, $cnt, $direction);
    }
}

$data = [3, 7, 4, 8, 6, 2, 1, 5];
bitonicSort($data, 0, count($data), true);
echo implode(' ', $data) . "\n";
