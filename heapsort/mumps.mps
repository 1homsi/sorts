HEAPSORT
    NEW arr,n,i,tmp
    SET arr(0)=12,arr(1)=11,arr(2)=13,arr(3)=5,arr(4)=6,arr(5)=7
    SET n=6
    FOR i=n\2-1:-1:0 DO HEAPIFY(n,i)
    FOR i=n-1:-1:1 DO
    . SET tmp=arr(0),arr(0)=arr(i),arr(i)=tmp
    . DO HEAPIFY(i,0)
    FOR i=0:1:n-1 WRITE arr(i)," "
    WRITE !
    QUIT

HEAPIFY(pn,pi)
    NEW largest,left,right,tmp
    SET largest=pi,left=2*pi+1,right=2*pi+2
    IF left<pn&(arr(left)>arr(largest)) SET largest=left
    IF right<pn&(arr(right)>arr(largest)) SET largest=right
    IF largest'=pi DO
    . SET tmp=arr(pi),arr(pi)=arr(largest),arr(largest)=tmp
    . DO HEAPIFY(pn,largest)
    QUIT
