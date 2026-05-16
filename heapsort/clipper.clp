PROCEDURE Main()
    LOCAL arr[6], n := 6, i, tmp
    arr[1]:=12; arr[2]:=11; arr[3]:=13; arr[4]:=5; arr[5]:=6; arr[6]:=7
    FOR i := INT(n/2) TO 1 STEP -1
        Heapify(@arr, n, i)
    NEXT
    FOR i := n TO 2 STEP -1
        tmp:=arr[1]; arr[1]:=arr[i]; arr[i]:=tmp
        Heapify(@arr, i-1, 1)
    NEXT
    FOR i := 1 TO n
        ? arr[i]
    NEXT
RETURN

PROCEDURE Heapify(arr, n, i)
    LOCAL largest:=i, left:=2*i, right:=2*i+1, tmp
    IF left<=n .AND. arr[left]>arr[largest]; largest:=left; ENDIF
    IF right<=n .AND. arr[right]>arr[largest]; largest:=right; ENDIF
    IF largest#i
        tmp:=arr[i]; arr[i]:=arr[largest]; arr[largest]:=tmp
        Heapify(@arr, n, largest)
    ENDIF
RETURN
