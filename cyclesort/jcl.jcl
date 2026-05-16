//CYCLESRT JOB (ACCT),'CYCLE SORT',CLASS=A,MSGCLASS=X
//STEP1    EXEC PGM=IEFBR14
//*
//* JCL cannot directly implement cycle sort algorithm.
//* This represents the job structure for a cycle sort program.
//* The actual sort would be done via DFSORT or a compiled program.
//*
//SORTIN   DD DSN=INPUT.DATA,DISP=SHR
//SORTOUT  DD DSN=OUTPUT.DATA,DISP=(NEW,CATLG),
//         UNIT=SYSDA,SPACE=(CYL,(1,1))
//SYSOUT   DD SYSOUT=*
//SYSIN    DD *
  SORT FIELDS=(1,4,ZD,A)
  OUTREC BUILD=(1,4)
/*
