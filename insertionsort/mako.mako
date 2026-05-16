<%!
def insertion_sort(arr):
    a = list(arr)
    n = len(a)
    for i in range(1, n):
        key = a[i]
        j = i - 1
        while j >= 0 and a[j] > key:
            a[j + 1] = a[j]
            j -= 1
        a[j + 1] = key
    return a
%>
<%
    result = insertion_sort([5, 3, 1, 4, 2])
%>
${result}
