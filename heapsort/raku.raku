sub heapify(@arr, Int $n, Int $i) {
    my $largest = $i;
    my $left = 2 * $i + 1;
    my $right = 2 * $i + 2;
    $largest = $left if $left < $n && @arr[$left] > @arr[$largest];
    $largest = $right if $right < $n && @arr[$right] > @arr[$largest];
    if $largest != $i {
        @arr[$i, $largest] = @arr[$largest, $i];
        heapify(@arr, $n, $largest);
    }
}

sub heapsort(@arr) {
    my $n = @arr.elems;
    heapify(@arr, $n, $_) for ($n div 2 - 1) ... 0;
    for ($n - 1) ... 1 -> $i {
        @arr[0, $i] = @arr[$i, 0];
        heapify(@arr, $i, 0);
    }
    @arr
}

my @arr = 12, 11, 13, 5, 6, 7;
say heapsort(@arr);
