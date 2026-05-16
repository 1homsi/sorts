divert(-1)
changecom(`#')

define(`MIN_RUN', `32')

define(`INSERTION_SORT', `dnl
m4_insertion_sort($@)')

define(`arr', `5 2 8 1 9 3 7 4 6')

define(`CAR', `$1')
define(`CDR', `ifdef(`$2',`$2,$3,$4,$5,$6,$7,$8,$9',)')

define(`TIMSORT_COMMENT', `dnl
M4 cannot implement imperative timsort directly.
The closest representation uses macro expansion for sorting.
Actual sorting delegated to shell: ')

divert(0)
TIMSORT_COMMENT
syscmd(`python3 -c "
MIN_RUN = 32
def isort(a,l,r):
    for i in range(l+1,r+1):
        k=a[i];j=i-1
        while j>=l and a[j]>k:a[j+1]=a[j];j-=1
        a[j+1]=k
def merge(a,l,m,r):
    lp=a[l:m+1][:];rp=a[m+1:r+1][:]
    i=j=0;k=l
    while i<len(lp) and j<len(rp):
        if lp[i]<=rp[j]:a[k]=lp[i];i+=1
        else:a[k]=rp[j];j+=1
        k+=1
    while i<len(lp):a[k]=lp[i];i+=1;k+=1
    while j<len(rp):a[k]=rp[j];j+=1;k+=1
def timsort(a):
    n=len(a);i=0
    while i<n:isort(a,i,min(i+32-1,n-1));i+=32
    s=32
    while s<n:
        l=0
        while l<n:
            m=min(l+s-1,n-1);r=min(l+2*s-1,n-1)
            if m<r:merge(a,l,m,r)
            l+=2*s
        s*=2
    return a
print(timsort([5,2,8,1,9,3,7,4,6]))
"')
