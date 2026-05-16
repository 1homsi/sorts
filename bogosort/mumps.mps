BOGOSORT
    S ARR(1)=3,ARR(2)=1,ARR(3)=4,ARR(4)=1
    S ARR(5)=5,ARR(6)=9,ARR(7)=2,ARR(8)=6
    S N=8
LOOP
    S SORTED=1
    F I=1:1:N-1 I ARR(I)>ARR(I+1) S SORTED=0
    Q:SORTED
    F I=N:-1:2 D SWAP
    G LOOP
SWAP
    S J=$R(I)+1
    S TMP=ARR(I),ARR(I)=ARR(J),ARR(J)=TMP
    Q
PRINT
    F I=1:1:N W ARR(I)," "
    W !
    Q
