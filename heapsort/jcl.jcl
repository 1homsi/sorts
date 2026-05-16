//HEAPSORT JOB (ACCT),'HEAPSORT',CLASS=A,MSGCLASS=X
//STEP1    EXEC PGM=IEFBR14
//*
//* JCL cannot express heapsort algorithm directly.
//* The following invokes a COBOL/PL1 program to perform heapsort.
//*
//SORTIN   DD *
12 11 13 05 06 07
/*
//SORTOUT  DD SYSOUT=*
//SYSIN    DD *
  SORT FIELDS=(1,2,ZD,A)
/*
//SYSOUT   DD SYSOUT=*
