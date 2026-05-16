ARR = 38 27 43 3 9 82 10

.PHONY: all sort

all: sort

sort:
	@python3 -c "\
arr = [38, 27, 43, 3, 9, 82, 10];\
def merge(l,r):\
    res=[];\
    i=j=0;\
    while i<len(l) and j<len(r):\
        (res.append(l[i]) or (i:=i+1)) if l[i]<=r[j] else (res.append(r[j]) or (j:=j+1));\
    return res+l[i:]+r[j:];\
def ms(a): return a if len(a)<=1 else merge(ms(a[:len(a)//2]),ms(a[len(a)//2:]));\
print(ms(arr))"
