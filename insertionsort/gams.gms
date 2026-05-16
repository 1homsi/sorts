$title Insertion Sort

sets i / 1*5 /;
parameters arr(i), sorted(i), key;
integer variable j, idx;

arr('1') = 5; arr('2') = 3; arr('3') = 1; arr('4') = 4; arr('5') = 2;

loop(i$(ord(i) > 1),
    key = arr(i);
    j = ord(i) - 1;
    while(j >= 1 and arr(j) > key,
        arr(j+1) = arr(j);
        j = j - 1;
    );
    arr(j+1) = key;
);

display arr;
