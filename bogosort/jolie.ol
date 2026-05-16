from console import Console
from runtime import Runtime

service Bogosort {
    embed Console as console
    embed Runtime as runtime

    define isSorted {
        arr -> arr_param;
        sorted = true;
        i = 0;
        while (i < #arr_param - 1) {
            if (arr_param[i] > arr_param[i+1]) {
                sorted = false
            };
            i++
        };
        sorted -> sorted_result
    }

    define shuffle {
        arr -> arr_param;
        n = #arr_param;
        i = n - 1;
        while (i > 0) {
            j = int(Math.random() * double(i+1));
            tmp = arr_param[i];
            arr_param[i] = arr_param[j];
            arr_param[j] = tmp;
            i--
        };
        arr_param -> arr_result
    }

    main {
        arr[0] = 3; arr[1] = 1; arr[2] = 4; arr[3] = 1;
        arr[4] = 5; arr[5] = 9; arr[6] = 2; arr[7] = 6;
        sorted = false;
        while (!sorted) {
            isSorted { arr -> sorted_result };
            sorted = sorted_result;
            if (!sorted) { shuffle { arr -> arr } }
        };
        println@console(arr)
    }
}
