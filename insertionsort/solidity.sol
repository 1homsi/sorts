// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InsertionSort {
    function sort(int256[] memory arr) public pure returns (int256[] memory) {
        uint256 n = arr.length;
        for (uint256 i = 1; i < n; i++) {
            int256 key = arr[i];
            int256 j = int256(i) - 1;
            while (j >= 0 && arr[uint256(j)] > key) {
                arr[uint256(j + 1)] = arr[uint256(j)];
                j--;
            }
            arr[uint256(j + 1)] = key;
        }
        return arr;
    }
}
