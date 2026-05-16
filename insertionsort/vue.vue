<template>
  <div>
    <button @click="sort">Sort</button>
    <p>{{ sorted.join(', ') }}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      arr: [5, 3, 1, 4, 2],
      sorted: []
    };
  },
  methods: {
    sort() {
      const a = [...this.arr];
      const n = a.length;
      for (let i = 1; i < n; i++) {
        const key = a[i];
        let j = i - 1;
        while (j >= 0 && a[j] > key) {
          a[j + 1] = a[j];
          j--;
        }
        a[j + 1] = key;
      }
      this.sorted = a;
    }
  }
};
</script>
