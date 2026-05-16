// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StoogeSort {
    function stoogeSort(uint[] memory arr, uint first, uint last) internal pure returns (uint[] memory) {
        if (arr[first] > arr[last]) {
            uint tmp = arr[first];
            arr[first] = arr[last];
            arr[last] = tmp;
        }
        if (last - first + 1 > 2) {
            uint t = (last - first + 1) * 2 / 3;
            arr = stoogeSort(arr, first, first + t - 1);
            arr = stoogeSort(arr, last - t + 1, last);
            arr = stoogeSort(arr, first, first + t - 1);
        }
        return arr;
    }

    function sort(uint[] memory arr) public pure returns (uint[] memory) {
        return stoogeSort(arr, 0, arr.length - 1);
    }
}
