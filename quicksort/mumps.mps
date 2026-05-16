QUICKSORT ;
    NEW arr,i
    SET arr(1)=3,arr(2)=6,arr(3)=8,arr(4)=10
    SET arr(5)=1,arr(6)=2,arr(7)=1
    DO QS(1,7)
    FOR i=1:1:7 WRITE arr(i)," "
    WRITE !
    QUIT

QS(LOW,HIGH) ;
    NEW PIVOT,I,J,TMP,P
    IF LOW>=HIGH QUIT
    SET PIVOT=arr(HIGH),I=LOW
    FOR J=LOW:1:HIGH-1 DO
    . IF arr(J)<=PIVOT DO
    . . SET TMP=arr(I),arr(I)=arr(J),arr(J)=TMP
    . . SET I=I+1
    SET TMP=arr(I),arr(I)=arr(HIGH),arr(HIGH)=TMP
    SET P=I
    DO QS(LOW,P-1)
    DO QS(P+1,HIGH)
    QUIT
