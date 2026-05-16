#version 330 core

uniform int arr[5];
out vec4 fragColor;

void bubbleSortLocal(inout int a[5]) {
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4 - i; j++) {
            if (a[j] > a[j+1]) {
                int tmp = a[j];
                a[j] = a[j+1];
                a[j+1] = tmp;
            }
        }
    }
}

void main() {
    int a[5];
    a[0] = 5; a[1] = 4; a[2] = 3; a[3] = 2; a[4] = 1;
    int n = 5;
    for (int cycleStart = 0; cycleStart < n - 1; cycleStart++) {
        int item = a[cycleStart];
        int pos = cycleStart;
        for (int i = cycleStart + 1; i < n; i++) {
            if (a[i] < item) pos++;
        }
        if (pos != cycleStart) {
            while (item == a[pos]) pos++;
            int tmp = a[pos]; a[pos] = item; item = tmp;
            while (pos != cycleStart) {
                pos = cycleStart;
                for (int i = cycleStart + 1; i < n; i++) {
                    if (a[i] < item) pos++;
                }
                while (item == a[pos]) pos++;
                tmp = a[pos]; a[pos] = item; item = tmp;
            }
        }
    }
    fragColor = vec4(float(a[0]), float(a[1]), float(a[2]), float(a[3])) / 5.0;
}
