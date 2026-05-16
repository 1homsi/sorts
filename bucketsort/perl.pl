use strict;
use warnings;

sub insertion_sort {
    my @bucket = @_;
    for my $i (1..$#bucket) {
        my $key = $bucket[$i];
        my $j = $i - 1;
        while ($j >= 0 && $bucket[$j] > $key) {
            $bucket[$j + 1] = $bucket[$j];
            $j--;
        }
        $bucket[$j + 1] = $key;
    }
    return @bucket;
}

sub bucket_sort {
    my @arr = @_;
    my $n = scalar @arr;
    return @arr if $n == 0;
    my $min = (sort { $a <=> $b } @arr)[0];
    my $max = (sort { $b <=> $a } @arr)[0];
    my @buckets = map { [] } 0..$n-1;
    for my $num (@arr) {
        my $idx = int(($num - $min) / ($max - $min + 1) * $n);
        $idx = $n - 1 if $idx >= $n;
        push @{$buckets[$idx]}, $num;
    }
    my @result;
    for my $bucket (@buckets) {
        push @result, insertion_sort(@$bucket);
    }
    return @result;
}

my @data = (0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68);
print join(", ", bucket_sort(@data)), "\n";
