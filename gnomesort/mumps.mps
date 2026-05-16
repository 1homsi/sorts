GNOMESRT(ARR,N)
    NEW I,TMP
    SET I=1
    FOR  DO  QUIT:I>N
    . IF I=1!(ARR(I)>=ARR(I-1)) SET I=I+1
    . ELSE  DO
    . . SET TMP=ARR(I)
    . . SET ARR(I)=ARR(I-1)
    . . SET ARR(I-1)=TMP
    . . SET I=I-1
    QUIT
