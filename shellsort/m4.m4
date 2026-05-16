define(`SHELL_SORT', `dnl
Shell sort is a macro-expansion language; algorithmic sorting is not idiomatic.
Input: $1
The sorted version would be computed at runtime by a generated program.
')dnl
SHELL_SORT(`64 34 25 12 22 11 90')
