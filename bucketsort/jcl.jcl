//BSORT    JOB  (ACCT),'BUCKET SORT',CLASS=A,MSGCLASS=X
//STEP1    EXEC PGM=IEFBR14
//*
//* JCL represents a closest approximation to bucket sort logic
//* using JCL constructs and SORT utility
//*
//SORTIN   DD *
78
17
39
26
72
94
21
12
23
68
/*
//SORTOUT  DD SYSOUT=*
//SYSIN    DD *
  SORT FIELDS=(1,3,BI,A)
  OUTREC FIELDS=(1,3)
/*
//SYSOUT   DD SYSOUT=*
//*
//* Bucket distribution would be done in a program step
//* This shows the SORT step which approximates the final output
