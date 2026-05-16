// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Quicksort {
    function partition(uint[] memory arr, uint low, uint high) internal pure returns (uint) {
        uint pivot = arr[high];
        uint i = low;
        for (uint j = low; j < high; j++) {
            if (arr[j] <= pivot) {
                (arr[i], arr[j]) = (arr[j], arr[i]);
                i++;
            }
        }
        (arr[i], arr[high]) = (arr[high], arr[i]);
        return i;
    }

    function quicksort(uint[] memory arr, uint low, uint high) internal pure {
        if (low < high) {
            uint p = partition(arr, low, high);
            if (p > 0) quicksort(arr, low, p - 1);
            quicksort(arr, p + 1, high);
        }
    }

    function sort(uint[] memory arr) public pure returns (uint[] memory) {
        if (arr.length > 0) quicksort(arr, 0, arr.length - 1);
        return arr;
    }
}
