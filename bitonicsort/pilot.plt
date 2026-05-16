C   This is a bitonic sort implementation in PILOT
T   Bitonic Sort Example
A   BITONICSORT(ARRAY, 0, 8, 1)
T   ARRAY contains sorted values
E   End of program

SUB BITONICSORT
  J   *LOOP
      I   CNT <= 1
      TYP   DONE
      A   K = CNT / 2
      A   BITONICSORT(ARRAY, LO, K, 1)
      A   BITONICSORT(ARRAY, LO + K, K, 0)
      A   BITONICMERGE(ARRAY, LO, CNT, DIR)
      J   *END

SUB BITONICMERGE
  J   *MERGE
      I   CNT <= 1
      TYP   DONE
      A   K = CNT / 2
      A   I = LO
      J   *SWAPLOOP
      I   I >= LO + CNT - K
      TYP   MERGEDONE
      I   (ARRAY(I) > ARRAY(I + K)) = (DIR = 1)
      A   TEMP = ARRAY(I)
      A   ARRAY(I) = ARRAY(I + K)
      A   ARRAY(I + K) = TEMP
      A   I = I + 1
      J   *SWAPLOOP
  *MERGEDONE
      A   BITONICMERGE(ARRAY, LO, K, DIR)
      A   BITONICMERGE(ARRAY, LO + K, K, DIR)
