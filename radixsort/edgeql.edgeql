WITH
    MODULE math,
    input := {170, 45, 75, 90, 802, 24, 2, 66},
    pass0 := (
        SELECT input
        ORDER BY input % 10 THEN input
    ),
    pass1 := (
        SELECT pass0
        ORDER BY (pass0 // 10) % 10 THEN pass0 % 10
    ),
    pass2 := (
        SELECT pass1
        ORDER BY (pass1 // 100) % 10 THEN (pass1 // 10) % 10 THEN pass1 % 10
    )
SELECT pass2;
