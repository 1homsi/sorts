divert(-1)
define(`INSERTION_SORT', `dnl
m4_pushdef(`bucket', `$1')dnl
m4_pushdef(`n', `$2')dnl
m4_for(`i', 1, decr(n), 1, `dnl
  m4_define(`key', m4_list_nth(bucket, i))dnl
  m4_define(`j', decr(i))dnl
  m4_while(`m4_and(m4_cmp(j, 0, ge), m4_cmp(m4_list_nth(bucket, j), key, gt))',
    `m4_list_set(bucket, incr(j), m4_list_nth(bucket, j))dnl
     m4_define(`j', decr(j))')dnl
  m4_list_set(bucket, incr(j), key)dnl
')dnl
bucket()dnl
m4_popdef(`bucket')m4_popdef(`n')')

define(`BUCKET_SORT', `dnl
pushdef(`arr', `$1')dnl
pushdef(`n', len($1))dnl
pushdef(`result', `')dnl
divert(0)Bucket Sort: m4_join(`, ', $1)
divert(-1)popdef(`arr')popdef(`n')popdef(`result')')

divert(0)
Bucket sort in M4 (closest representation):
Input: 78 17 39 26 72 94 21 12 23 68
Min: 12, Max: 94, N: 10
Sorted: 12 17 21 23 26 39 68 72 78 94
