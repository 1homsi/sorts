NUMS := 3 6 8 10 1 2 1

.PHONY: all sort

all: sort

sort:
	@python3 -c "\
import sys; \
def qs(a): \
    if len(a)<=1: return a; \
    p=a[len(a)//2]; \
    return qs([x for x in a if x<p])+[x for x in a if x==p]+qs([x for x in a if x>p]); \
print(qs([3,6,8,10,1,2,1]))"
