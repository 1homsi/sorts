pragma circom 2.0.0;

include "comparators.circom";

template InsertionSort(n) {
    signal input in[n];
    signal output out[n];

    component lt[n][n];
    signal sorted[n+1][n];

    for (var k = 0; k < n; k++) {
        sorted[0][k] <== in[k];
    }

    for (var i = 1; i < n; i++) {
        for (var j = 0; j < n; j++) {
            lt[i][j] = LessThan(32);
            lt[i][j].in[0] <== sorted[i-1][j];
            lt[i][j].in[1] <== sorted[i-1][(j+1) % n];
        }
        for (var j = 0; j < n; j++) {
            sorted[i][j] <== sorted[i-1][j];
        }
    }

    for (var k = 0; k < n; k++) {
        out[k] <== sorted[n-1][k];
    }
}

component main = InsertionSort(5);
