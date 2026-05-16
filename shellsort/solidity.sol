// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShellSort {
    function shellSort(uint[] memory arr) public pure returns (uint[] memory) {
        uint n = arr.length;
        uint gap = n / 2;
        while (gap > 0) {
            for (uint i = gap; i < n; i++) {
                uint temp = arr[i];
                uint j = i;
                while (j >= gap && arr[j - gap] > temp) {
                    arr[j] = arr[j - gap];
                    j -= gap;
                }
                arr[j] = temp;
            }
            gap /= 2;
        }
        return arr;
    }
}
