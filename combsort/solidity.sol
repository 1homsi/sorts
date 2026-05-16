// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CombSort {
    function sort(int256[] memory arr) public pure returns (int256[] memory) {
        uint256 n = arr.length;
        uint256 gap = n;
        bool sorted = false;
        while (!sorted) {
            gap = (gap * 10) / 13;
            if (gap <= 1) {
                gap = 1;
                sorted = true;
            }
            for (uint256 i = 0; i + gap < n; i++) {
                if (arr[i] > arr[i + gap]) {
                    int256 tmp = arr[i];
                    arr[i] = arr[i + gap];
                    arr[i + gap] = tmp;
                    sorted = false;
                }
            }
        }
        return arr;
    }
}
