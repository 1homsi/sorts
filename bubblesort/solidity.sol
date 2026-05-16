// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BubbleSort {
    function bubbleSort(uint[] memory arr) public pure returns (uint[] memory) {
        uint n = arr.length;
        bool swapped;
        do {
            swapped = false;
            for (uint i = 0; i < n - 1; i++) {
                if (arr[i] > arr[i + 1]) {
                    uint tmp = arr[i];
                    arr[i] = arr[i + 1];
                    arr[i + 1] = tmp;
                    swapped = true;
                }
            }
            n--;
        } while (swapped);
        return arr;
    }
}
