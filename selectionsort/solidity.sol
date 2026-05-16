// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SelectionSort {
    function sort(uint[] memory arr) public pure returns (uint[] memory) {
        uint n = arr.length;
        for (uint i = 0; i < n; i++) {
            uint minIdx = i;
            for (uint j = i + 1; j < n; j++) {
                if (arr[j] < arr[minIdx]) minIdx = j;
            }
            uint tmp = arr[i]; arr[i] = arr[minIdx]; arr[minIdx] = tmp;
        }
        return arr;
    }
}
