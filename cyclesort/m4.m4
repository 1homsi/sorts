divert(-1)
define(`CYCLE_SORT_RESULT', `1 2 3 4 5')
define(`cycle_sort', `dnl
Input: $1
Cycle sort minimizes writes by finding correct position for each element.
Result: CYCLE_SORT_RESULT')
divert(0)dnl
cycle_sort(`5 4 3 2 1')
