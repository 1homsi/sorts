<script>
  let arr = [5, 3, 8, 1, 9, 2, 7, 4, 6, 0];
  let sorted = [];

  function gnomeSort(input) {
    const a = [...input];
    let i = 0, n = a.length;
    while (i < n) {
      if (i === 0 || a[i] >= a[i-1]) i++;
      else { [a[i], a[i-1]] = [a[i-1], a[i]]; i--; }
    }
    return a;
  }

  function doSort() {
    sorted = gnomeSort(arr);
  }
</script>

<button on:click={doSort}>Sort</button>
<ul>
  {#each sorted as val}
    <li>{val}</li>
  {/each}
</ul>
