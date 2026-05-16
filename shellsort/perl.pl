sub shellsort {
    my @arr = @_;
    my $n = scalar @arr;
    my $gap = int($n / 2);
    while ($gap > 0) {
        for my $i ($gap..$n-1) {
            my $temp = $arr[$i];
            my $j = $i;
            while ($j >= $gap && $arr[$j-$gap] > $temp) {
                $arr[$j] = $arr[$j-$gap];
                $j -= $gap;
            }
            $arr[$j] = $temp;
        }
        $gap = int($gap / 2);
    }
    return @arr;
}
