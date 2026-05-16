$title Quicksort

Set i / 1*7 /;
Parameter data(i) / 1 3, 2 6, 3 8, 4 10, 5 1, 6 2, 7 1 /;

Parameter sorted(i);
sorted(i) = data(i);

Scalar pivot, tmp, lo, hi, p;
lo = 1; hi = 7;

$macro swap(a,b) tmp = sorted(a); sorted(a) = sorted(b); sorted(b) = tmp;

Display sorted;
