sub bubble_sort {
    my @arr = @_;
    my $n = scalar @arr;
    my $swapped;
    do {
        $swapped = 0;
        for my $i (0 .. $n - 2) {
            if ($arr[$i] > $arr[$i + 1]) {
                ($arr[$i], $arr[$i + 1]) = ($arr[$i + 1], $arr[$i]);
                $swapped = 1;
            }
        }
        $n--;
    } while ($swapped);
    return @arr;
}

my @arr = (64, 34, 25, 12, 22, 11, 90);
@arr = bubble_sort(@arr);
print join(" ", @arr) . "\n";
