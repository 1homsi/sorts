// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CountingSort {
    function sort(uint256[] memory arr) public pure returns (uint256[] memory) {
        uint256 n = arr.length;
        if (n == 0) return arr;
        uint256 min = arr[0];
        uint256 max = arr[0];
        for (uint256 i = 1; i < n; i++) {
            if (arr[i] < min) min = arr[i];
            if (arr[i] > max) max = arr[i];
        }
        uint256 range = max - min + 1;
        uint256[] memory count = new uint256[](range);
        for (uint256 i = 0; i < n; i++) count[arr[i] - min]++;
        for (uint256 i = 1; i < range; i++) count[i] += count[i - 1];
        uint256[] memory output = new uint256[](n);
        for (uint256 i = n; i > 0; i--) {
            count[arr[i - 1] - min]--;
            output[count[arr[i - 1] - min]] = arr[i - 1];
        }
        return output;
    }
}
