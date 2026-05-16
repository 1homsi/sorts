ISORT(ARR,N)
    FOR I=1:1:N-1 DO
    . SET KEY=ARR(I)
    . SET J=I-1
    . FOR  QUIT:J<0!ARR(J)'>KEY  DO
    . . SET ARR(J+1)=ARR(J)
    . . SET J=J-1
    . SET ARR(J+1)=KEY
    QUIT
