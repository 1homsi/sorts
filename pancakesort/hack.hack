<?hh
$arr = vec[5, 2, 8, 1, 9, 3];
$n = count($arr);
for ($i = 0; $i < $n - 1; $i++) {
    for ($j = 0; $j < $n - $i - 1; $j++) {
        if ($arr[$j] > $arr[$j + 1]) {
            $temp = $arr[$j];
            $arr[$j] = $arr[$j + 1];
            $arr[$j + 1] = $temp;
        }
    }
}
echo "Pancake Sort: " . json_encode($arr) . "\n";
