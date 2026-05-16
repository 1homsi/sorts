OPENQASM 2.0;
include "qelib1.inc";

gate bitonicsort q {
}

qreg q[8];
creg c[8];

bitonicsort q;

measure q -> c;
