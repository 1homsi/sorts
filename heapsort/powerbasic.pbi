DIM arr(0 TO 5) AS INTEGER
arr(0)=12 : arr(1)=11 : arr(2)=13 : arr(3)=5 : arr(4)=6 : arr(5)=7

SUB Heapify(BYVAL pn AS INTEGER, BYVAL pi AS INTEGER)
    DIM largest AS INTEGER = pi
    DIM left AS INTEGER = 2*pi+1
    DIM right AS INTEGER = 2*pi+2
    DIM tmp AS INTEGER
    IF left<pn AND arr(left)>arr(largest) THEN largest=left
    IF right<pn AND arr(right)>arr(largest) THEN largest=right
    IF largest<>pi THEN
        tmp=arr(pi) : arr(pi)=arr(largest) : arr(largest)=tmp
        Heapify(pn, largest)
    END IF
END SUB

SUB Heapsort(BYVAL n AS INTEGER)
    DIM i AS INTEGER, tmp AS INTEGER
    FOR i = n\2-1 TO 0 STEP -1 : Heapify(n, i) : NEXT
    FOR i = n-1 TO 1 STEP -1
        tmp=arr(0) : arr(0)=arr(i) : arr(i)=tmp
        Heapify(i, 0)
    NEXT
END SUB

Heapsort(6)
DIM i AS INTEGER
FOR i=0 TO 5 : PRINT arr(i); " "; : NEXT
PRINT
