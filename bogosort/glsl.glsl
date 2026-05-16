#version 330 core

float arr[8] = float[8](3.0, 1.0, 4.0, 1.0, 5.0, 9.0, 2.0, 6.0);

bool isSorted() {
    for (int i = 0; i < 7; i++) {
        if (arr[i] > arr[i + 1]) return false;
    }
    return true;
}

float rand(float seed) {
    return fract(sin(seed) * 43758.5453123);
}

void shuffle(float seed) {
    for (int i = 7; i > 0; i--) {
        int j = int(rand(seed + float(i)) * float(i + 1));
        float tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
}

void main() {
    float seed = 0.0;
    while (!isSorted()) {
        shuffle(seed);
        seed += 1.0;
    }
}
