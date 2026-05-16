sub selection_sort {
    my @arr = @_;
    my $n = scalar @arr;
    for my $i (0 .. $n - 1) {
        my $min_idx = $i;
        for my $j ($i + 1 .. $n - 1) {
            $min_idx = $j if $arr[$j] < $arr[$min_idx];
        }
        @arr[$i, $min_idx] = @arr[$min_idx, $i];
    }
    return @arr;
}
