<template>
  <ul>
    <li v-for="x in sorted" :key="x">{{ x }}</li>
  </ul>
</template>

<script>
export default {
  data() {
    return {
      arr: [3, 6, 8, 10, 1, 2, 1]
    }
  },
  computed: {
    sorted() {
      return this.quicksort([...this.arr]);
    }
  },
  methods: {
    quicksort(arr) {
      if (arr.length <= 1) return arr;
      const pivot = arr[Math.floor(arr.length / 2)];
      const left = arr.filter(x => x < pivot);
      const mid = arr.filter(x => x === pivot);
      const right = arr.filter(x => x > pivot);
      return [...this.quicksort(left), ...mid, ...this.quicksort(right)];
    }
  }
}
</script>
