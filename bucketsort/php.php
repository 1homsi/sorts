<?php
function insertionSort(array &$bucket): void {
    $n = count($bucket);
    for ($i = 1; $i < $n; $i++) {
        $key = $bucket[$i];
        $j = $i - 1;
        while ($j >= 0 && $bucket[$j] > $key) {
            $bucket[$j + 1] = $bucket[$j];
            $j--;
        }
        $bucket[$j + 1] = $key;
    }
}

function bucketSort(array $arr): array {
    $n = count($arr);
    if ($n === 0) return $arr;
    $min = min($arr);
    $max = max($arr);
    $buckets = array_fill(0, $n, []);
    foreach ($arr as $num) {
        $idx = (int)(($num - $min) / ($max - $min + 1) * $n);
        if ($idx >= $n) $idx = $n - 1;
        $buckets[$idx][] = $num;
    }
    $result = [];
    foreach ($buckets as &$bucket) {
        insertionSort($bucket);
        $result = array_merge($result, $bucket);
    }
    return $result;
}

$data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68];
print_r(bucketSort($data));
