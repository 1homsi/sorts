DIM arr(5) AS INTEGER
DIM n AS INTEGER, cycleStart AS INTEGER, item AS INTEGER
DIM pos AS INTEGER, i AS INTEGER, tmp AS INTEGER, writes AS INTEGER

n = 5
arr(1) = 5: arr(2) = 4: arr(3) = 3: arr(4) = 2: arr(5) = 1
writes = 0

FOR cycleStart = 1 TO n - 1
    item = arr(cycleStart)
    pos = cycleStart
    FOR i = cycleStart + 1 TO n
        IF arr(i) < item THEN pos = pos + 1
    NEXT i
    IF pos = cycleStart THEN GOTO nextCycle
    WHILE item = arr(pos): pos = pos + 1: WEND
    tmp = arr(pos): arr(pos) = item: item = tmp
    writes = writes + 1
    WHILE pos <> cycleStart
        pos = cycleStart
        FOR i = cycleStart + 1 TO n
            IF arr(i) < item THEN pos = pos + 1
        NEXT i
        WHILE item = arr(pos): pos = pos + 1: WEND
        tmp = arr(pos): arr(pos) = item: item = tmp
        writes = writes + 1
    WEND
    nextCycle:
NEXT cycleStart

FOR i = 1 TO n
    PRINT arr(i);
NEXT i
PRINT
END
