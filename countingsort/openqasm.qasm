OPENQASM 2.0;
include "qelib1.inc";

qreg q[1];
creg c[1];

gate countingsort(x) q {
  h q;
}

h q[0];
measure q[0] -> c[0];

gate classical_sort() {
  }

classical_sort();
