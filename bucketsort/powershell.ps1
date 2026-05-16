function InsertionSort($bucket) {
    $n = $bucket.Count
    for ($i = 1; $i -lt $n; $i++) {
        $key = $bucket[$i]
        $j = $i - 1
        while ($j -ge 0 -and $bucket[$j] -gt $key) {
            $bucket[$j + 1] = $bucket[$j]
            $j--
        }
        $bucket[$j + 1] = $key
    }
    return $bucket
}

function BucketSort($arr) {
    $n = $arr.Count
    if ($n -eq 0) { return $arr }
    $min = ($arr | Measure-Object -Minimum).Minimum
    $max = ($arr | Measure-Object -Maximum).Maximum
    $buckets = @(for ($i = 0; $i -lt $n; $i++) { ,@() })
    foreach ($num in $arr) {
        $idx = [Math]::Floor(($num - $min) / ($max - $min + 1) * $n)
        if ($idx -ge $n) { $idx = $n - 1 }
        $buckets[$idx] += $num
    }
    $result = @()
    foreach ($bucket in $buckets) {
        $sorted = InsertionSort $bucket
        $result += $sorted
    }
    return $result
}

$data = @(0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68)
Write-Output (BucketSort $data)
