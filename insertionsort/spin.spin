int arr[5];
int n = 5;

proctype InsertionSortProc() {
    int i = 1, j, key;
    do
    :: i < n ->
        key = arr[i];
        j = i - 1;
        do
        :: j >= 0 && arr[j] > key ->
            arr[j+1] = arr[j];
            j--;
        :: else -> break
        od;
        arr[j+1] = key;
        i++;
    :: else -> break
    od;
}

init {
    arr[0] = 5; arr[1] = 3; arr[2] = 1; arr[3] = 4; arr[4] = 2;
    run InsertionSortProc();
}
