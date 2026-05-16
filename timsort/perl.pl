use strict;
use warnings;

use constant MIN_RUN => 32;

sub insertion_sort {
    my ($arr, $left, $right) = @_;
    for my $i ($left + 1 .. $right) {
        my $key = $arr->[$i];
        my $j = $i - 1;
        while ($j >= $left && $arr->[$j] > $key) {
            $arr->[$j + 1] = $arr->[$j];
            $j--;
        }
        $arr->[$j + 1] = $key;
    }
}

sub merge {
    my ($arr, $left, $mid, $right) = @_;
    my @lp = @{$arr}[$left .. $mid];
    my @rp = @{$arr}[$mid + 1 .. $right];
    my ($i, $j, $k) = (0, 0, $left);
    while ($i < scalar @lp && $j < scalar @rp) {
        if ($lp[$i] <= $rp[$j]) { $arr->[$k++] = $lp[$i++]; }
        else { $arr->[$k++] = $rp[$j++]; }
    }
    while ($i < scalar @lp) { $arr->[$k++] = $lp[$i++]; }
    while ($j < scalar @rp) { $arr->[$k++] = $rp[$j++]; }
}

sub timsort {
    my ($arr) = @_;
    my $n = scalar @$arr;
    my $i = 0;
    while ($i < $n) {
        my $right = $i + MIN_RUN - 1;
        $right = $n - 1 if $right >= $n;
        insertion_sort($arr, $i, $right);
        $i += MIN_RUN;
    }
    my $size = MIN_RUN;
    while ($size < $n) {
        my $left = 0;
        while ($left < $n) {
            my $mid = $left + $size - 1;
            $mid = $n - 1 if $mid >= $n;
            my $right = $left + 2 * $size - 1;
            $right = $n - 1 if $right >= $n;
            merge($arr, $left, $mid, $right) if $mid < $right;
            $left += 2 * $size;
        }
        $size *= 2;
    }
    return $arr;
}

my @arr = (5, 2, 8, 1, 9, 3, 7, 4, 6);
timsort(\@arr);
print join(", ", @arr), "\n";
