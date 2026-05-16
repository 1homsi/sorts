include "qelib1.inc";
qreg q[6];
creg c[6];

barrier q;
measure q -> c;