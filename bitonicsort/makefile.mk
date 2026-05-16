DATA := 3 7 4 8 6 2 1 5

.PHONY: all sort

all: sort

sort:
	@python3 -c "\
data = [3, 7, 4, 8, 6, 2, 1, 5]; \
def cas(a,i,j,d): \
    [a.__setitem__(i,a[j]),a.__setitem__(j,a[i])] if d==(a[i]>a[j]) else None; \
def bm(a,lo,cnt,d): \
    [cas(a,i,i+k,d) for k in [cnt//2] for i in range(lo,lo+k)] or \
    (bm(a,lo,cnt//2,d),bm(a,lo+cnt//2,cnt//2,d)) if cnt>1 else None; \
def bs(a,lo,cnt,d): \
    (bs(a,lo,k:=cnt//2,True),bs(a,lo+k,k,False),bm(a,lo,cnt,d)) if cnt>1 else None; \
bs(data,0,len(data),True); print(data)"
