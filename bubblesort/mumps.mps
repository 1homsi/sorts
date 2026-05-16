BSORT
    S ARR(1)=64,ARR(2)=34,ARR(3)=25,ARR(4)=12
    S ARR(5)=22,ARR(6)=11,ARR(7)=90
    S N=7
OUTER
    S SW=0
    F I=1:1:N-1 D SWAP
    S N=N-1
    I SW G OUTER
    F I=1:1:7 W ARR(I)," "
    W !
    Q
SWAP
    I ARR(I)>ARR(I+1) D
    . S T=ARR(I)
    . S ARR(I)=ARR(I+1)
    . S ARR(I+1)=T
    . S SW=1
    Q
