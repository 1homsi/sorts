module quicksort_tb;
    int arr[7] = '{3, 6, 8, 10, 1, 2, 1};

    function automatic int partition(ref int arr[], int low, int high);
        int pivot = arr[high];
        int i = low, tmp;
        for (int j = low; j < high; j++) begin
            if (arr[j] <= pivot) begin
                tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
                i++;
            end
        end
        tmp = arr[i]; arr[i] = arr[high]; arr[high] = tmp;
        return i;
    endfunction

    function automatic void quicksort(ref int arr[], int low, int high);
        if (low < high) begin
            int p = partition(arr, low, high);
            quicksort(arr, low, p - 1);
            quicksort(arr, p + 1, high);
        end
    endfunction

    initial begin
        quicksort(arr, 0, 6);
        foreach (arr[i]) $display("%0d", arr[i]);
        $finish;
    end
endmodule
