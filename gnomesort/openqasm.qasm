OPENQASM 2.0;
include "qelib1.inc";

gate gnomesort(a, b) {
  if a > b {
    swap a, b;
  }
}

qreg q[6];
creg c[6];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

measure q -> c;
