use strict;
use warnings;

sub flip {
    my ($arr, $k) = @_;
    my ($left, $right) = (0, $k);
    while ($left < $right) {
        @{$arr}[$left, $right] = @{$arr}[$right, $left];
        $left++; $right--;
    }
}

sub pancake_sort {
    my @arr = @_;
    my $n = scalar @arr;
    for my $size (reverse 2..$n) {
        my $max_idx = 0;
        for my $i (1..$size-1) {
            if ($arr[$i] > $arr[$max_idx]) { $max_idx = $i; }
        }
        if ($max_idx != $size - 1) {
            flip(\@arr, $max_idx) if $max_idx != 0;
            flip(\@arr, $size - 1);
        }
    }
    return @arr;
}

my @arr = (3, 6, 2, 7, 4, 1, 5);
print join(", ", pancake_sort(@arr)) . "\n";
