pragma circom 2.0.0;

template SelectionSort(n) {
    signal input in[n];
    signal output out[n];
    
    signal min[n][n];
    signal minIdx[n];
    
    for (var i = 0; i < n; i++) {
        min[i][i] <== in[i];
        for (var j = i + 1; j < n; j++) {
            var isLess = in[j] < min[i][j-1] ? 1 : 0;
            min[i][j] <== isLess * in[j] + (1 - isLess) * min[i][j-1];
        }
        out[i] <== min[i][n-1];
    }
}

component main = SelectionSort(5);
