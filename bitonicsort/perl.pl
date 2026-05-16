use strict;
use warnings;

sub compare_and_swap {
    my ($arr, $i, $j, $dir) = @_;
    if ($dir == ($arr->[$i] > $arr->[$j])) {
        ($arr->[$i], $arr->[$j]) = ($arr->[$j], $arr->[$i]);
    }
}

sub bitonic_merge {
    my ($arr, $lo, $cnt, $dir) = @_;
    if ($cnt > 1) {
        my $k = int($cnt / 2);
        for my $i ($lo .. $lo + $k - 1) {
            compare_and_swap($arr, $i, $i + $k, $dir);
        }
        bitonic_merge($arr, $lo, $k, $dir);
        bitonic_merge($arr, $lo + $k, $k, $dir);
    }
}

sub bitonic_sort {
    my ($arr, $lo, $cnt, $dir) = @_;
    if ($cnt > 1) {
        my $k = int($cnt / 2);
        bitonic_sort($arr, $lo, $k, 1);
        bitonic_sort($arr, $lo + $k, $k, 0);
        bitonic_merge($arr, $lo, $cnt, $dir);
    }
}

my @data = (3, 7, 4, 8, 6, 2, 1, 5);
bitonic_sort(\@data, 0, scalar @data, 1);
print join(' ', @data), "\n";
