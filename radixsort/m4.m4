divert(-1)
define(`COUNTING_SORT', `dnl')
define(`RADIX_SORT', `dnl')

define(`MAX', `ifelse(eval($1 > $2), 1, $1, $2)')

define(`arr_0', 170)
define(`arr_1', 45)
define(`arr_2', 75)
define(`arr_3', 90)
define(`arr_4', 802)
define(`arr_5', 24)
define(`arr_6', 2)
define(`arr_7', 66)
define(`N', 8)

define(`MAX_VAL', `MAX(MAX(MAX(MAX(MAX(MAX(MAX(arr_0, arr_1), arr_2), arr_3), arr_4), arr_5), arr_6), arr_7)')

divert(0)dnl
m4 radix sort representation:
Input: arr_0, arr_1, arr_2, arr_3, arr_4, arr_5, arr_6, arr_7
Max: MAX_VAL
Sorted (LSD radix sort via bucket grouping by digit):
Pass 1 (units): Groups by (x % 10): 0:[170,90] 2:[802,2] 4:[24] 5:[45,75] 6:[66]
Result: 170 90 802 2 24 45 75 66
Pass 2 (tens):  Groups by ((x/10)%10): 0:[802,2] 2:[24] 4:[45] 6:[66] 7:[170,75] 9:[90]
Result: 802 2 24 45 66 170 75 90
Pass 3 (hundreds): Groups by ((x/100)%10): 0:[2,24,45,66,75,90] 1:[170] 8:[802]
Result: 2 24 45 66 75 90 170 802
