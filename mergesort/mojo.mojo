from python import Python

fn merge(left: PythonObject, right: PythonObject) raises -> PythonObject:
    let builtins = Python.import_module("builtins")
    var result = builtins.list()
    var i = 0
    var j = 0
    let ll = builtins.len(left).__index__()
    let rl = builtins.len(right).__index__()
    while i < ll and j < rl:
        if left[i] <= right[j]:
            _ = result.append(left[i])
            i += 1
        else:
            _ = result.append(right[j])
            j += 1
    while i < ll:
        _ = result.append(left[i])
        i += 1
    while j < rl:
        _ = result.append(right[j])
        j += 1
    return result

fn merge_sort(arr: PythonObject) raises -> PythonObject:
    let builtins = Python.import_module("builtins")
    let n = builtins.len(arr).__index__()
    if n <= 1:
        return arr
    let mid = n // 2
    let left = merge_sort(arr[:mid])
    let right = merge_sort(arr[mid:])
    return merge(left, right)

fn main() raises:
    let builtins = Python.import_module("builtins")
    let arr = builtins.list([38, 27, 43, 3, 9, 82, 10])
    let sorted = merge_sort(arr)
    print(sorted)
