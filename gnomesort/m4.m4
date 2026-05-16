define(`GNOME_SORT', `dnl
pushdef(`ARR', `$1')dnl
pushdef(`N', `$2')dnl
pushdef(`I', `0')dnl
')dnl

define(`SWAP', `dnl
pushdef(`TMP', ARR[$1])dnl
ARR[$1] = ARR[$2]
ARR[$2] = TMP
popdef(`TMP')dnl
')dnl
