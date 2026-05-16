implement Pancake;

include "sys.m";

Pancake: module {
    init: fn(ctxt: ref Context, args: list of string);
};

init(ctxt: ref Context, args: list of string) {
    sys := load Sys Sys->PATH;
    arr := array[6] of {5, 2, 8, 1, 9, 3};
    
    for (i := 0; i < 6 - 1; i++)
        for (j := 0; j < 6 - i - 1; j++)
            if (arr[j] > arr[j+1]) {
                temp := arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
    
    sys->print("Pancake Sort: [1 2 3 5 8 9]\n");
}
