// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CocktailSort {
    function sort(int256[] memory arr) public pure returns (int256[] memory) {
        bool swapped = true;
        uint256 start = 0;
        uint256 end = arr.length - 1;
        while (swapped) {
            swapped = false;
            for (uint256 i = start; i < end; i++) {
                if (arr[i] > arr[i + 1]) {
                    int256 tmp = arr[i];
                    arr[i] = arr[i + 1];
                    arr[i + 1] = tmp;
                    swapped = true;
                }
            }
            if (!swapped) break;
            swapped = false;
            end--;
            for (uint256 i = end - 1; i >= start && i < end; i--) {
                if (arr[i] > arr[i + 1]) {
                    int256 tmp = arr[i];
                    arr[i] = arr[i + 1];
                    arr[i + 1] = tmp;
                    swapped = true;
                }
                if (i == 0) break;
            }
            start++;
        }
        return arr;
    }
}
