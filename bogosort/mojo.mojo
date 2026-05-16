from random import random_ui64
from python import Python

fn is_sorted(arr: DynamicVector[Int]) -> Bool:
    for i in range(len(arr) - 1):
        if arr[i] > arr[i + 1]:
            return False
    return True

fn shuffle(inout arr: DynamicVector[Int]):
    let n = len(arr)
    for i in range(n - 1, 0, -1):
        let j = int(random_ui64(0, i))
        let tmp = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp

fn bogosort(inout arr: DynamicVector[Int]):
    while not is_sorted(arr):
        shuffle(arr)

fn main():
    var arr = DynamicVector[Int]()
    arr.push_back(3)
    arr.push_back(1)
    arr.push_back(4)
    arr.push_back(1)
    arr.push_back(5)
    arr.push_back(9)
    arr.push_back(2)
    arr.push_back(6)
    bogosort(arr)
    for i in range(len(arr)):
        print(arr[i], end=" ")
    print()
