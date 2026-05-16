//PANCAKE  JOB (ACCT),'PANCAKE SORT',CLASS=A,MSGCLASS=X
//STEP1    EXEC PGM=IEFBR14
//*
//* JCL cannot directly implement pancake sort as it is a job
//* control language. The algorithm would be implemented in
//* COBOL, PL/I, or Assembler called from JCL.
//*
//SORT     EXEC PGM=SORT
//SORTIN   DD *
0003
0006
0002
0007
0004
0001
0005
//SORTOUT  DD SYSOUT=*
//SYSIN    DD *
  SORT FIELDS=(1,4,ZD,A)
/*
//
