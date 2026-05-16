sub cocktail_sort {
    my @arr = @_;
    my $swapped = 1;
    my $start = 0;
    my $end = $#arr;
    while ($swapped) {
        $swapped = 0;
        for my $i ($start .. $end - 1) {
            if ($arr[$i] > $arr[$i + 1]) {
                @arr[$i, $i + 1] = @arr[$i + 1, $i];
                $swapped = 1;
            }
        }
        last unless $swapped;
        $swapped = 0;
        $end--;
        for my $i (reverse $start .. $end - 1) {
            if ($arr[$i] > $arr[$i + 1]) {
                @arr[$i, $i + 1] = @arr[$i + 1, $i];
                $swapped = 1;
            }
        }
        $start++;
    }
    return @arr;
}
