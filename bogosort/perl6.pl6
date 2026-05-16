sub bogosort {
    my $arr = shift;
    while (!is_sorted($arr)) {
        my $n = @$arr;
        for (my $i = $n - 1; $i > 0; $i--) {
            my $j = int(rand($i + 1));
            @$arr[$i, $j] = @$arr[$j, $i];
        }
    }
    return $arr;
}

sub is_sorted {
    my $arr = shift;
    for (my $i = 0; $i < @$arr - 1; $i++) {
        return 0 if $arr->[$i] > $arr->[$i + 1];
    }
    return 1;
}
