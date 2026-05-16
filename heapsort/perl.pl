sub heapify {
    my ($arr, $n, $i) = @_;
    my $largest = $i;
    my $left = 2 * $i + 1;
    my $right = 2 * $i + 2;
    $largest = $left if $left < $n && $arr->[$left] > $arr->[$largest];
    $largest = $right if $right < $n && $arr->[$right] > $arr->[$largest];
    if ($largest != $i) {
        ($arr->[$i], $arr->[$largest]) = ($arr->[$largest], $arr->[$i]);
        heapify($arr, $n, $largest);
    }
}

sub heapsort {
    my ($arr) = @_;
    my $n = scalar @$arr;
    for (my $i = int($n / 2) - 1; $i >= 0; $i--) { heapify($arr, $n, $i); }
    for (my $i = $n - 1; $i > 0; $i--) {
        ($arr->[0], $arr->[$i]) = ($arr->[$i], $arr->[0]);
        heapify($arr, $i, 0);
    }
}

my @arr = (12, 11, 13, 5, 6, 7);
heapsort(\@arr);
print join(" ", @arr) . "\n";
