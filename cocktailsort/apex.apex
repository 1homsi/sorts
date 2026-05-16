public class CocktailSort {
    public static List<Integer> sort(List<Integer> arr) {
        Boolean swapped = true;
        Integer start = 0;
        Integer ending = arr.size() - 1;
        while (swapped) {
            swapped = false;
            for (Integer i = start; i < ending; i++) {
                if (arr[i] > arr[i + 1]) {
                    Integer tmp = arr[i];
                    arr[i] = arr[i + 1];
                    arr[i + 1] = tmp;
                    swapped = true;
                }
            }
            if (!swapped) break;
            swapped = false;
            ending--;
            for (Integer i = ending - 1; i >= start; i--) {
                if (arr[i] > arr[i + 1]) {
                    Integer tmp = arr[i];
                    arr[i] = arr[i + 1];
                    arr[i + 1] = tmp;
                    swapped = true;
                }
            }
            start++;
        }
        return arr;
    }
}
