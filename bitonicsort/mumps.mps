BITONIC ;
    N ARR,I
    S ARR(1)=3,ARR(2)=7,ARR(3)=4,ARR(4)=8
    S ARR(5)=6,ARR(6)=2,ARR(7)=1,ARR(8)=5
    D BSORT(1,8,1)
    F I=1:1:8 W ARR(I)," "
    W !
    Q

BSORT(LO,CNT,DIR) ;
    I CNT>1 D
    . N K
    . S K=CNT\2
    . D BSORT(LO,K,1)
    . D BSORT(LO+K,K,0)
    . D BMERGE(LO,CNT,DIR)
    Q

BMERGE(LO,CNT,DIR) ;
    I CNT>1 D
    . N K,I
    . S K=CNT\2
    . F I=LO:1:LO+K-1 D CSWAP(I,I+K,DIR)
    . D BMERGE(LO,K,DIR)
    . D BMERGE(LO+K,K,DIR)
    Q

CSWAP(I,J,DIR) ;
    N AI,AJ,TMP
    S AI=ARR(I),AJ=ARR(J)
    I (DIR=1&(AI>AJ))!(DIR=0&(AI<AJ)) D
    . S ARR(I)=AJ,ARR(J)=AI
    Q
