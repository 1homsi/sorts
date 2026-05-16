Sets i /1*5/;
Parameters a(i) /1 5, 2 3, 3 1, 4 4, 5 2/;
Parameters sorted(i), minVal, minIdx, tmp;

$onembedded
loop(i$(ord(i) < card(i)),
    minVal = a(i);
    minIdx = ord(i);
    loop(j$(ord(j) > ord(i)),
        if (a(j) < minVal,
            minVal = a(j);
            minIdx = ord(j);
        );
    );
    tmp = a(i);
    a(i) = minVal;
    a(minIdx) = tmp;
);
$offembedded

display a;
