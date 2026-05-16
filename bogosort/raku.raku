sub is-sorted(@arr) {
    for 0 ..^ @arr.end -> $i {
        return False if @arr[$i] > @arr[$i + 1];
    }
    True
}

sub bogosort(@arr) {
    my @a = @arr;
    @a = @a.pick(*) until is-sorted(@a);
    @a
}

my @arr = 3, 1, 4, 1, 5, 9, 2, 6;
say bogosort(@arr);
