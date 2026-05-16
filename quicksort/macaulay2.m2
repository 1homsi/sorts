quicksort = method()
quicksort List := lst -> (
    if #lst <= 1 then return lst;
    pivot := lst#(floor(#lst/2));
    left := select(lst, x -> x < pivot);
    mid := select(lst, x -> x == pivot);
    right := select(lst, x -> x > pivot);
    quicksort(left) | mid | quicksort(right)
)

print quicksort({3, 6, 8, 10, 1, 2, 1})
