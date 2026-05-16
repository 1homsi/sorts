// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BitonicSort {
    function compareAndSwap(uint[] memory arr, uint i, uint j, bool direction) internal pure {
        if (direction == (arr[i] > arr[j])) {
            uint tmp = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
        }
    }

    function bitonicMerge(uint[] memory arr, uint lo, uint cnt, bool direction) internal pure {
        if (cnt > 1) {
            uint k = cnt / 2;
            for (uint i = lo; i < lo + k; i++) {
                compareAndSwap(arr, i, i + k, direction);
            }
            bitonicMerge(arr, lo, k, direction);
            bitonicMerge(arr, lo + k, k, direction);
        }
    }

    function bitonicSort(uint[] memory arr, uint lo, uint cnt, bool direction) internal pure {
        if (cnt > 1) {
            uint k = cnt / 2;
            bitonicSort(arr, lo, k, true);
            bitonicSort(arr, lo + k, k, false);
            bitonicMerge(arr, lo, cnt, direction);
        }
    }

    function sort(uint[] memory data) public pure returns (uint[] memory) {
        bitonicSort(data, 0, data.length, true);
        return data;
    }
}
