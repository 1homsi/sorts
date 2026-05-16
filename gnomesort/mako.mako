<%!
def gnome_sort(arr):
    a = list(arr)
    n = len(a)
    i = 0
    while i < n:
        if i == 0 or a[i] >= a[i-1]:
            i += 1
        else:
            a[i], a[i-1] = a[i-1], a[i]
            i -= 1
    return a
%>
<%
data = [5, 3, 8, 1, 9, 2, 7, 4, 6, 0]
result = gnome_sort(data)
%>
${result}
