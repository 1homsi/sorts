<template>
  <div>
    <button @click="sort">Sort</button>
    <ul>
      <li v-for="val in sorted" :key="val">{{ val }}</li>
    </ul>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const arr = [5, 3, 1, 4, 2]
const sorted = ref([])

function selectionSort(arr) {
    const n = arr.length
    const result = [...arr]
    for (let i = 0; i < n; i++) {
        let minIdx = i
        for (let j = i + 1; j < n; j++) {
            if (result[j] < result[minIdx]) minIdx = j
        }
        ;[result[i], result[minIdx]] = [result[minIdx], result[i]]
    }
    return result
}

function sort() {
    sorted.value = selectionSort(arr)
}
</script>
