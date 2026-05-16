MERGESORT ;
    N ARR,TMP,I
    S ARR(1)=38,ARR(2)=27,ARR(3)=43,ARR(4)=3
    S ARR(5)=9,ARR(6)=82,ARR(7)=10
    D MSORT(1,7)
    F I=1:1:7 W ARR(I)," "
    W !
    Q

MSORT(LO,HI) ;
    N MID
    I LO>=HI Q
    S MID=(LO+HI)\2
    D MSORT(LO,MID)
    D MSORT(MID+1,HI)
    D MERGE(LO,MID,HI)
    Q

MERGE(LO,MID,HI) ;
    N I,J,K,X
    S I=LO,J=MID+1,K=LO
    F  Q:(I>MID)!(J>HI)  D
    .  I ARR(I)<=ARR(J) S TMP(K)=ARR(I),I=I+1
    .  E  S TMP(K)=ARR(J),J=J+1
    .  S K=K+1
    F  Q:I>MID  S TMP(K)=ARR(I),I=I+1,K=K+1
    F  Q:J>HI  S TMP(K)=ARR(J),J=J+1,K=K+1
    F X=LO:1:HI S ARR(X)=TMP(X)
    Q
