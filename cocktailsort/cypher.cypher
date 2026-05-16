WITH [5, 3, 8, 1, 9, 2, 7, 4, 6, 0] AS input
CALL {
    WITH input
    WITH input AS arr, size(input) AS n
    WITH arr, 0 AS start, n-1 AS end, true AS swapped
    RETURN arr AS sorted
}
RETURN sorted;
