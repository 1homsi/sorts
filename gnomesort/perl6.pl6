sub gnome-sort(@arr is copy) {
    my $i = 0;
    while $i < @arr.elems {
        if $i == 0 || @arr[$i] >= @arr[$i - 1] {
            $i++;
        } else {
            (@arr[$i], @arr[$i - 1]) = (@arr[$i - 1], @arr[$i]);
            $i--;
        }
    }
    @arr;
}
