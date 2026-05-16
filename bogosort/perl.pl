use List::Util qw(shuffle);

sub is_sorted {
    my @arr = @_;
    for my $i (0 .. $#arr - 1) {
        return 0 if $arr[$i] > $arr[$i + 1];
    }
    return 1;
}

sub bogosort {
    my @arr = @_;
    until (is_sorted(@arr)) {
        @arr = shuffle(@arr);
    }
    return @arr;
}

my @arr = (3, 1, 4, 1, 5, 9, 2, 6);
my @sorted = bogosort(@arr);
print join(", ", @sorted), "\n";
