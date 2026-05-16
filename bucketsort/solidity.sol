// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BucketSort {
    function insertionSort(uint256[] memory bucket) internal pure returns (uint256[] memory) {
        uint256 n = bucket.length;
        for (uint256 i = 1; i < n; i++) {
            uint256 key = bucket[i];
            uint256 j = i;
            while (j > 0 && bucket[j - 1] > key) {
                bucket[j] = bucket[j - 1];
                j--;
            }
            bucket[j] = key;
        }
        return bucket;
    }

    function bucketSort(uint256[] memory arr) public pure returns (uint256[] memory) {
        uint256 n = arr.length;
        if (n == 0) return arr;
        uint256 minV = arr[0];
        uint256 maxV = arr[0];
        for (uint256 i = 1; i < n; i++) {
            if (arr[i] < minV) minV = arr[i];
            if (arr[i] > maxV) maxV = arr[i];
        }
        uint256[][] memory buckets = new uint256[][](n);
        uint256[] memory counts = new uint256[](n);
        for (uint256 i = 0; i < n; i++) buckets[i] = new uint256[](n);
        for (uint256 i = 0; i < n; i++) {
            uint256 idx = (arr[i] - minV) * n / (maxV - minV + 1);
            if (idx >= n) idx = n - 1;
            buckets[idx][counts[idx]++] = arr[i];
        }
        uint256 pos = 0;
        for (uint256 b = 0; b < n; b++) {
            uint256[] memory bkt = new uint256[](counts[b]);
            for (uint256 i = 0; i < counts[b]; i++) bkt[i] = buckets[b][i];
            bkt = insertionSort(bkt);
            for (uint256 i = 0; i < bkt.length; i++) arr[pos++] = bkt[i];
        }
        return arr;
    }
}
