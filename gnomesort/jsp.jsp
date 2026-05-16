<%@ page language="java" %>
<%!
    int[] gnomeSort(int[] arr) {
        int n = arr.length;
        int i = 0;
        while (i < n) {
            if (i == 0 || arr[i] >= arr[i-1]) {
                i++;
            } else {
                int tmp = arr[i];
                arr[i] = arr[i-1];
                arr[i-1] = tmp;
                i--;
            }
        }
        return arr;
    }
%>
<%
    int[] data = {5, 3, 8, 1, 9, 2, 7, 4, 6, 0};
    int[] sorted = gnomeSort(data);
    for (int v : sorted) {
        out.print(v + " ");
    }
%>
