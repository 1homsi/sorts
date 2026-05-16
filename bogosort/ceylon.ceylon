import ceylon.collection { ArrayList }
import ceylon.math.float { random }

Boolean isSorted(ArrayList<Integer> arr) {
    for (i in 0:arr.size - 1) {
        if (exists a = arr[i], exists b = arr[i + 1], a > b) {
            return false;
        }
    }
    return true;
}

void shuffle(ArrayList<Integer> arr) {
    value n = arr.size;
    for (i in (n - 1)..1) {
        value j = (random() * (i + 1)).integer;
        value tmp = arr[i];
        if (exists a = tmp, exists b = arr[j]) {
            arr.set(i, b);
            arr.set(j, a);
        }
    }
}

void bogosort(ArrayList<Integer> arr) {
    while (!isSorted(arr)) {
        shuffle(arr);
    }
}

shared void run() {
    value arr = ArrayList<Integer> { 3, 1, 4, 1, 5, 9, 2, 6 };
    bogosort(arr);
    print(arr);
}
