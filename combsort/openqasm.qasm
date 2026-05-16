OPENQASM 2.0;
include "qelib1.inc";

qreg q[6];
creg c[6];

cx q[0], q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
measure q[3] -> c[3];
measure q[4] -> c[4];
measure q[5] -> c[5];
