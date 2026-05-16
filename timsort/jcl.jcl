//TIMSORT  JOB (ACCT),'TIMSORT',CLASS=A,MSGCLASS=X
//STEP1    EXEC PGM=IEFBR14
//*
//* JCL cannot implement algorithms directly.
//* Timsort logic represented as a SORT step.
//*
//SORT     EXEC PGM=SORT
//SYSOUT   DD SYSOUT=*
//SORTIN   DD *
5
2
8
1
9
3
7
4
6
/*
//SORTOUT  DD SYSOUT=*
//SYSIN    DD *
  SORT FIELDS=(1,1,CH,A)
/*
//
