function sorted = bubbleSort(arr)
    n = length(arr);
    swapped = true;
    while swapped
        swapped = false;
        for i = 1:n-1
            if arr(i) > arr(i+1)
                tmp = arr(i);
                arr(i) = arr(i+1);
                arr(i+1) = tmp;
                swapped = true;
            end
        end
        n = n - 1;
    end
    sorted = arr;
end

arr = [64, 34, 25, 12, 22, 11, 90];
disp(bubbleSort(arr));
