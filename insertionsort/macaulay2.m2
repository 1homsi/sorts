insertionSort = method()
insertionSort List := arr -> (
    a := new MutableList from arr;
    n := #a;
    for i from 1 to n-1 do (
        key := a#i;
        j := i - 1;
        while j >= 0 and a#j > key do (
            a#(j+1) = a#j;
            j = j - 1;
        );
        a#(j+1) = key;
    );
    toList a
)
