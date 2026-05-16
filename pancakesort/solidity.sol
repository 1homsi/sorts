// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PancakeSort {
    function flip(uint[] memory arr, uint k) internal pure {
        uint left = 0;
        uint right = k;
        while (left < right) {
            uint tmp = arr[left];
            arr[left] = arr[right];
            arr[right] = tmp;
            left++;
            right--;
        }
    }

    function pancakeSort(uint[] memory arr) public pure returns (uint[] memory) {
        uint size = arr.length;
        while (size > 1) {
            uint maxIdx = 0;
            for (uint i = 1; i < size; i++) {
                if (arr[i] > arr[maxIdx]) maxIdx = i;
            }
            if (maxIdx != size - 1) {
                if (maxIdx != 0) flip(arr, maxIdx);
                flip(arr, size - 1);
            }
            size--;
        }
        return arr;
    }
}
