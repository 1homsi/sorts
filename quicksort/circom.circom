pragma circom 2.0.0;

template Comparator() {
    signal input a;
    signal input b;
    signal output out;
    out <-- a <= b ? 1 : 0;
    out * (out - 1) === 0;
    out * (a - b) === out * (a - b);
}

template QuicksortVerifier(n) {
    signal input arr[n];
    signal input sorted[n];
    signal output valid;

    component cmp[n-1];
    for (var i = 0; i < n-1; i++) {
        cmp[i] = Comparator();
        cmp[i].a <== sorted[i];
        cmp[i].b <== sorted[i+1];
    }

    var all_sorted = 1;
    for (var i = 0; i < n-1; i++) {
        all_sorted *= cmp[i].out;
    }
    valid <-- all_sorted;
}

component main = QuicksortVerifier(7);
