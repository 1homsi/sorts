UNWIND [170, 45, 75, 90, 802, 24, 2, 66] AS val
CREATE (:Number {val: val})
WITH collect(val) AS arr
UNWIND range(0, 2) AS pass
WITH arr, pass, 10^pass AS exp
UNWIND arr AS val
WITH val, (val / exp) % 10 AS digit, exp
ORDER BY digit, val
WITH collect(val) AS sorted_pass
RETURN sorted_pass AS sorted
