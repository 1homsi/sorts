divert(-1)
define(`arr0', 12)
define(`arr1', 11)
define(`arr2', 13)
define(`arr3', 5)
define(`arr4', 6)
define(`arr5', 7)
define(`n', 6)

define(`GET', `arr$1')
define(`SET', `define(`arr$1', $2)')

define(`MAX', `ifelse(eval($1 > $2), 1, $1, $2)')

define(`HEAPIFY', `dnl
  define(`LARGEST', $2)dnl
  define(`LEFT', eval(2 * $2 + 1))dnl
  define(`RIGHT', eval(2 * $2 + 2))dnl
  ifelse(eval(LEFT < $1 && GET(LEFT) > GET(LARGEST)), 1, `define(`LARGEST', LEFT)')dnl
  ifelse(eval(RIGHT < $1 && GET(RIGHT) > GET(LARGEST)), 1, `define(`LARGEST', RIGHT)')dnl
  ifelse(eval(LARGEST != $2), 1, `dnl
    define(`TMP', GET($2))dnl
    SET($2, GET(LARGEST))dnl
    SET(LARGEST, TMP)dnl
    HEAPIFY($1, LARGEST)dnl
  ')dnl
')dnl

divert(0)dnl
Input: arr0 arr1 arr2 arr3 arr4 arr5
HEAPIFY(n, 2)
HEAPIFY(n, 1)
HEAPIFY(n, 0)
After build-heap: arr0 arr1 arr2 arr3 arr4 arr5
