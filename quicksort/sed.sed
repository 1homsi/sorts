#!/usr/bin/env sed -f
# Sed cannot implement quicksort recursively, but demonstrates
# the concept of partitioning by pattern matching
# Input: numbers on separate lines
# This sorts single-digit numbers by repeated comparison passes

/^$/d
:sort
N
s/\n/ /
/[0-9]* [0-9]*/!b end
# Simple bubble sort pass (closest to partition logic in sed)
s/\(9\) \(.*\)\([0-8]\)/\3 \2\1/g
s/\(8\) \(.*\)\([0-7]\)/\3 \2\1/g
s/\(7\) \(.*\)\([0-6]\)/\3 \2\1/g
s/\(6\) \(.*\)\([0-5]\)/\3 \2\1/g
s/\(5\) \(.*\)\([0-4]\)/\3 \2\1/g
s/\(4\) \(.*\)\([0-3]\)/\3 \2\1/g
s/\(3\) \(.*\)\([0-2]\)/\3 \2\1/g
s/\(2\) \(.*\)\(1\)/\3 \2\1/g
:end
p
