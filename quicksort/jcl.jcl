//QUICKSRT JOB (ACCT),'QUICKSORT',CLASS=A,MSGCLASS=X
//STEP1    EXEC PGM=IEFBR14
//*
//* JCL cannot express algorithms directly. This represents
//* a quicksort invocation via a COBOL or PL/I program call.
//*
//SORT     EXEC PGM=SORT
//SYSOUT   DD SYSOUT=*
//SORTIN   DD *
00000003
00000006
00000008
00000010
00000001
00000002
00000001
/*
//SORTOUT  DD SYSOUT=*
//SYSIN    DD *
  SORT FIELDS=(1,8,CH,A)
/*
