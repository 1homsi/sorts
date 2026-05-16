// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Heapsort {
    function heapify(uint[] memory arr, uint n, uint i) internal pure {
        uint largest = i;
        uint left = 2 * i + 1;
        uint right = 2 * i + 2;
        if (left < n && arr[left] > arr[largest]) largest = left;
        if (right < n && arr[right] > arr[largest]) largest = right;
        if (largest != i) {
            uint tmp = arr[i]; arr[i] = arr[largest]; arr[largest] = tmp;
            heapify(arr, n, largest);
        }
    }

    function heapsort(uint[] memory arr) public pure returns (uint[] memory) {
        uint n = arr.length;
        for (int i = int(n / 2) - 1; i >= 0; i--) heapify(arr, n, uint(i));
        for (uint i = n - 1; i > 0; i--) {
            uint tmp = arr[0]; arr[0] = arr[i]; arr[i] = tmp;
            heapify(arr, i, 0);
        }
        return arr;
    }
}
