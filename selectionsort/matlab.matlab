function arr = selectionSort(arr)
    n = length(arr);
    for i = 1:n-1
        minIdx = i;
        for j = i+1:n
            if arr(j) < arr(minIdx)
                minIdx = j;
            end
        end
        tmp = arr(i); arr(i) = arr(minIdx); arr(minIdx) = tmp;
    end
end
