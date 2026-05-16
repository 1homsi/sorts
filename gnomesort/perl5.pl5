sub gnome_sort {
    my @arr = @_;
    my $i = 0;
    while ($i < scalar @arr) {
        if ($i == 0 || $arr[$i] >= $arr[$i - 1]) {
            $i++;
        } else {
            @arr[$i, $i - 1] = @arr[$i - 1, $i];
            $i--;
        }
    }
    return @arr;
}
