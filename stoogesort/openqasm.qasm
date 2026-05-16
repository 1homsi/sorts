OPENQASM 2.0;
include "qelib1.inc";

gate stoogesort(i, j) a {
  cx a[i], a[j];
  cx a[j], a[i];
  cx a[i], a[j];
}

qreg q[6];
creg c[6];

stoogesort(0, 1) q;
stoogesort(1, 2) q;

measure q -> c;
