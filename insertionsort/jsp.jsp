<%@ page language="java" %>
<%!
    int[] insertionSort(int[] arr) {
        int n = arr.length;
        for (int i = 1; i < n; i++) {
            int key = arr[i];
            int j = i - 1;
            while (j >= 0 && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
        return arr;
    }
%>
<%
    int[] arr = {5, 3, 1, 4, 2};
    arr = insertionSort(arr);
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < arr.length; i++) {
        sb.append(arr[i]);
        if (i < arr.length - 1) sb.append(", ");
    }
    out.print(sb.toString());
%>
