sub comb_sort {
    my @arr = @_;
    my $n = scalar @arr;
    my $gap = $n;
    my $shrink = 1.3;
    my $sorted = 0;
    while (!$sorted) {
        $gap = int($gap / $shrink);
        if ($gap <= 1) {
            $gap = 1;
            $sorted = 1;
        }
        for my $i (0 .. $n - $gap - 1) {
            if ($arr[$i] > $arr[$i + $gap]) {
                ($arr[$i], $arr[$i + $gap]) = ($arr[$i + $gap], $arr[$i]);
                $sorted = 0;
            }
        }
    }
    return @arr;
}
