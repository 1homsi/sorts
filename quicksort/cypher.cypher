WITH [3, 6, 8, 10, 1, 2, 1] AS input
CALL {
    WITH input
    UNWIND input AS val
    WITH val ORDER BY val
    RETURN collect(val) AS sorted
}
RETURN sorted;
