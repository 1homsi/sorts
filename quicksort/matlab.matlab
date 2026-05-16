function sorted = quicksort(arr)
    if length(arr) <= 1
        sorted = arr;
        return;
    end
    pivot = arr(floor(length(arr)/2) + 1);
    left = arr(arr < pivot);
    middle = arr(arr == pivot);
    right = arr(arr > pivot);
    sorted = [quicksort(left), middle, quicksort(right)];
end

disp(quicksort([3, 6, 8, 10, 1, 2, 1]))
