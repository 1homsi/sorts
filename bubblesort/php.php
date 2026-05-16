<?php
function bubbleSort(array $arr): array {
    $n = count($arr);
    do {
        $swapped = false;
        for ($i = 0; $i < $n - 1; $i++) {
            if ($arr[$i] > $arr[$i + 1]) {
                [$arr[$i], $arr[$i + 1]] = [$arr[$i + 1], $arr[$i]];
                $swapped = true;
            }
        }
        $n--;
    } while ($swapped);
    return $arr;
}

$arr = [64, 34, 25, 12, 22, 11, 90];
$sorted = bubbleSort($arr);
echo implode(' ', $sorted) . PHP_EOL;
