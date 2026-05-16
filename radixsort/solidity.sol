// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RadixSort {
    function countingSort(uint256[] memory arr, uint256 exp) internal pure {
        uint256 n = arr.length;
        uint256[] memory output = new uint256[](n);
        uint256[10] memory count;
        for (uint256 i = 0; i < n; i++) count[(arr[i] / exp) % 10]++;
        for (uint256 i = 1; i < 10; i++) count[i] += count[i - 1];
        for (uint256 i = n; i > 0; i--) {
            uint256 idx = (arr[i - 1] / exp) % 10;
            count[idx]--;
            output[count[idx]] = arr[i - 1];
        }
        for (uint256 i = 0; i < n; i++) arr[i] = output[i];
    }

    function sort(uint256[] memory arr) public pure returns (uint256[] memory) {
        if (arr.length == 0) return arr;
        uint256 max = arr[0];
        for (uint256 i = 1; i < arr.length; i++) if (arr[i] > max) max = arr[i];
        for (uint256 exp = 1; max / exp > 0; exp *= 10) countingSort(arr, exp);
        return arr;
    }
}
