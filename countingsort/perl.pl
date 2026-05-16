sub counting_sort {
    my @arr = @_;
    return @arr unless @arr;
    my ($min, $max) = ($arr[0], $arr[0]);
    for (@arr) { $min = $_ if $_ < $min; $max = $_ if $_ > $max; }
    my $range = $max - $min + 1;
    my @count = (0) x $range;
    $count[$_ - $min]++ for @arr;
    $count[$_] += $count[$_ - 1] for 1 .. $range - 1;
    my @output = (0) x scalar @arr;
    for my $v (reverse @arr) {
        $output[--$count[$v - $min]] = $v;
    }
    return @output;
}

print join(" ", counting_sort(4, 2, 2, 8, 3, 3, 1)), "\n";
