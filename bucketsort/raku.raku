sub insertion-sort(@bucket) {
    my @arr = @bucket;
    for 1..@arr.end -> $i {
        my $key = @arr[$i];
        my $j = $i - 1;
        while $j >= 0 && @arr[$j] > $key {
            @arr[$j + 1] = @arr[$j];
            $j--;
        }
        @arr[$j + 1] = $key;
    }
    @arr
}

sub bucket-sort(@arr) {
    return @arr unless @arr;
    my $n = @arr.elems;
    my $min = @arr.min;
    my $max = @arr.max;
    my @buckets = [] xx $n;
    for @arr -> $num {
        my $idx = (($num - $min) / ($max - $min + 1) * $n).Int;
        $idx = $n - 1 if $idx >= $n;
        @buckets[$idx].push($num);
    }
    @buckets.map({ insertion-sort($_) }).flat.list
}

say bucket-sort([0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]);
