<template>
  <div>
    <button @click="doSort">Sort</button>
    <ul>
      <li v-for="val in sorted" :key="val">{{ val }}</li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      arr: [5, 3, 8, 1, 9, 2, 7, 4, 6, 0],
      sorted: []
    };
  },
  methods: {
    doSort() {
      const a = [...this.arr];
      let i = 0, n = a.length;
      while (i < n) {
        if (i === 0 || a[i] >= a[i-1]) i++;
        else { [a[i], a[i-1]] = [a[i-1], a[i]]; i--; }
      }
      this.sorted = a;
    }
  }
};
</script>
