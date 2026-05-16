// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TimSort {
    uint constant MIN_RUN = 32;

    function insertionSort(uint[] memory arr, uint left, uint right) internal pure {
        for (uint i = left + 1; i <= right; i++) {
            uint key = arr[i];
            uint j = i;
            while (j > left && arr[j - 1] > key) {
                arr[j] = arr[j - 1];
                j--;
            }
            arr[j] = key;
        }
    }

    function merge(uint[] memory arr, uint left, uint mid, uint right) internal pure {
        uint ln = mid - left + 1;
        uint rn = right - mid;
        uint[] memory lp = new uint[](ln);
        uint[] memory rp = new uint[](rn);
        for (uint i = 0; i < ln; i++) lp[i] = arr[left + i];
        for (uint i = 0; i < rn; i++) rp[i] = arr[mid + 1 + i];
        uint i = 0; uint j = 0; uint k = left;
        while (i < ln && j < rn) {
            if (lp[i] <= rp[j]) { arr[k++] = lp[i++]; }
            else { arr[k++] = rp[j++]; }
        }
        while (i < ln) { arr[k++] = lp[i++]; }
        while (j < rn) { arr[k++] = rp[j++]; }
    }

    function timsort(uint[] memory arr) public pure returns (uint[] memory) {
        uint n = arr.length;
        uint i = 0;
        while (i < n) {
            uint right = i + MIN_RUN - 1 < n ? i + MIN_RUN - 1 : n - 1;
            insertionSort(arr, i, right);
            i += MIN_RUN;
        }
        uint size = MIN_RUN;
        while (size < n) {
            uint left = 0;
            while (left < n) {
                uint mid = left + size - 1 < n ? left + size - 1 : n - 1;
                uint right = left + 2 * size - 1 < n ? left + 2 * size - 1 : n - 1;
                if (mid < right) merge(arr, left, mid, right);
                left += 2 * size;
            }
            size *= 2;
        }
        return arr;
    }
}
