int arr[7];
int n = 7;

proctype partition(int low; int high; chan result) {
    int pivot = arr[high];
    int i = low;
    int j = low;
    int tmp;
    do
    :: j < high ->
        if
        :: arr[j] <= pivot ->
            tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
            i++
        :: else -> skip
        fi;
        j++
    :: else -> break
    od;
    tmp = arr[i]; arr[i] = arr[high]; arr[high] = tmp;
    result ! i
}

init {
    arr[0] = 3; arr[1] = 6; arr[2] = 8; arr[3] = 10;
    arr[4] = 1; arr[5] = 2; arr[6] = 1;
    int i = 0;
    do
    :: i < n -> printf("%d\n", arr[i]); i++
    :: else -> break
    od
}
