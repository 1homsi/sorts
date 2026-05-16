function arr = pancake_sort(arr)
    n = length(arr);
    for size = n:-1:2
        [~, max_idx] = max(arr(1:size));
        if max_idx ~= size
            if max_idx ~= 1
                arr(1:max_idx) = arr(max_idx:-1:1);
            end
            arr(1:size) = arr(size:-1:1);
        end
    end
end

arr = [3 6 2 7 4 1 5];
disp(pancake_sort(arr))
