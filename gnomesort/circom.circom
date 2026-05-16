pragma circom 2.0.0;

template GnomeSort(n) {
    signal input in[n];
    signal output out[n];

    for (var k = 0; k < n; k++) {
        out[k] <== in[k];
    }

    component comparators[n-1];
    for (var i = 0; i < n-1; i++) {
        comparators[i] = LessEqThan(32);
        comparators[i].in[0] <== out[i];
        comparators[i].in[1] <== out[i+1];
        comparators[i].out === 1;
    }
}

template LessEqThan(n) {
    signal input in[2];
    signal output out;
    out <== in[0] <= in[1] ? 1 : 0;
}

component main = GnomeSort(10);
