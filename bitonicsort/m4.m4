divert(-1)

define(`SWAP', `define(`ARR_$1', ARR_$2)define(`ARR_$2', $3)')
define(`ARR_0', 3) define(`ARR_1', 7) define(`ARR_2', 4) define(`ARR_3', 8)
define(`ARR_4', 6) define(`ARR_5', 2) define(`ARR_6', 1) define(`ARR_7', 5)

define(`CAS', `ifelse(eval($3 && (ARR_$1 > ARR_$2)), 1,
    `SWAP($1, $2, ARR_$1)',
    `ifelse(eval(!$3 && (ARR_$1 < ARR_$2)), 1,
        `SWAP($1, $2, ARR_$1)')')')

divert(0)dnl
Bitonic Sort in M4
Input: ARR_0 ARR_1 ARR_2 ARR_3 ARR_4 ARR_5 ARR_6 ARR_7
