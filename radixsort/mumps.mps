RADIX ;
    NEW arr,output,cnt,n,maxVal,exp,i,idx,val
    SET arr(1)=170,arr(2)=45,arr(3)=75,arr(4)=90
    SET arr(5)=802,arr(6)=24,arr(7)=2,arr(8)=66
    SET n=8
    SET maxVal=arr(1)
    FOR i=2:1:n DO
    .IF arr(i)>maxVal SET maxVal=arr(i)
    SET exp=1
    FOR  QUIT:(maxVal\exp=0)  DO CSORT
    SET i=1
    FOR  QUIT:(i>n)  WRITE arr(i)," " SET i=i+1
    WRITE !
    QUIT

CSORT ;
    FOR i=0:1:9 SET cnt(i)=0
    FOR i=1:1:n DO
    .SET idx=arr(i)\exp#10
    .SET cnt(idx)=cnt(idx)+1
    FOR i=1:1:9 SET cnt(i)=cnt(i)+cnt(i-1)
    FOR i=n:-1:1 DO
    .SET idx=arr(i)\exp#10
    .SET cnt(idx)=cnt(idx)-1
    .SET output(cnt(idx))=arr(i)
    FOR i=1:1:n SET arr(i)=output(i-1)
    SET exp=exp*10
    QUIT
