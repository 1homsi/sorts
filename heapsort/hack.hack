<?hh
function heapsort(array<int> &$arr): void {
    $n = count($arr);
    for ($i = intdiv($n, 2) - 1; $i >= 0; $i--) {
        siftDown($arr, $i, $n);
    }
    for ($i = $n - 1; $i > 0; $i--) {
        $temp = $arr[0];
        $arr[0] = $arr[$i];
        $arr[$i] = $temp;
        siftDown($arr, 0, $i);
    }
}

function siftDown(array<int> &$arr, int $i, int $n): void {
    $largest = $i;
    $left = 2 * $i + 1;
    $right = 2 * $i + 2;
    if ($left < $n && $arr[$left] > $arr[$largest]) {
        $largest = $left;
    }
    if ($right < $n && $arr[$right] > $arr[$largest]) {
        $largest = $right;
    }
    if ($largest !== $i) {
        $temp = $arr[$i];
        $arr[$i] = $arr[$largest];
        $arr[$largest] = $temp;
        siftDown($arr, $largest, $n);
    }
}

$arr = vec[5, 2, 8, 1, 9, 3];
heapsort(inout $arr);
var_dump($arr);
