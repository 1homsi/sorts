def gnome_sort(arr, n):
  i = 0
  loop i < n:
    if i == 0:
      i = i + 1
    elif arr[i] >= arr[i-1]:
      i = i + 1
    else:
      tmp = arr[i]
      arr[i] = arr[i-1]
      arr[i-1] = tmp
      i = i - 1
  return arr

def main():
  arr = [5, 3, 8, 1, 9, 2, 7, 4, 6, 0]
  return gnome_sort(arr, 10)
