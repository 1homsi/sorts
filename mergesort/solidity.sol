pragma solidity ^0.8.0;

contract MergeSort {
    function merge(int[] memory left, int[] memory right)
        internal pure returns (int[] memory)
    {
        int[] memory result = new int[](left.length + right.length);
        uint i = 0; uint j = 0; uint k = 0;
        while (i < left.length && j < right.length) {
            if (left[i] <= right[j]) { result[k++] = left[i++]; }
            else { result[k++] = right[j++]; }
        }
        while (i < left.length) result[k++] = left[i++];
        while (j < right.length) result[k++] = right[j++];
        return result;
    }

    function mergeSort(int[] memory arr) public pure returns (int[] memory) {
        if (arr.length <= 1) return arr;
        uint mid = arr.length / 2;
        int[] memory left = new int[](mid);
        int[] memory right = new int[](arr.length - mid);
        for (uint i = 0; i < mid; i++) left[i] = arr[i];
        for (uint i = mid; i < arr.length; i++) right[i - mid] = arr[i];
        return merge(mergeSort(left), mergeSort(right));
    }
}
