<?php
function cocktailSort(array &$arr): void {
    $swapped = true;
    $start = 0;
    $end = count($arr) - 1;
    while ($swapped) {
        $swapped = false;
        for ($i = $start; $i < $end; $i++) {
            if ($arr[$i] > $arr[$i + 1]) {
                [$arr[$i], $arr[$i + 1]] = [$arr[$i + 1], $arr[$i]];
                $swapped = true;
            }
        }
        if (!$swapped) break;
        $swapped = false;
        $end--;
        for ($i = $end - 1; $i >= $start; $i--) {
            if ($arr[$i] > $arr[$i + 1]) {
                [$arr[$i], $arr[$i + 1]] = [$arr[$i + 1], $arr[$i]];
                $swapped = true;
            }
        }
        $start++;
    }
}
