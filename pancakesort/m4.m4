divert(-1)
define(`FLIP', `dnl
pushdef(`LEFT', 0)dnl
pushdef(`RIGHT', $1)dnl
')dnl

define(`PANCAKE_SORT_DESC', `dnl
Pancake sort algorithm in M4:
1. Find max in unsorted prefix of size N
2. Flip prefix to bring max to front
3. Flip entire unsorted portion to move max to end
4. Reduce N by 1, repeat until sorted
Input: 3 6 2 7 4 1 5
')dnl
divert(0)dnl
PANCAKE_SORT_DESC
