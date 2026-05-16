<script>
    let arr = [5, 3, 1, 4, 2];
    let sorted = [];

    function selectionSort(arr) {
        const n = arr.length;
        const result = [...arr];
        for (let i = 0; i < n; i++) {
            let minIdx = i;
            for (let j = i + 1; j < n; j++) {
                if (result[j] < result[minIdx]) minIdx = j;
            }
            [result[i], result[minIdx]] = [result[minIdx], result[i]];
        }
        return result;
    }

    function sort() {
        sorted = selectionSort(arr);
    }
</script>

<button on:click={sort}>Sort</button>
<ul>
    {#each sorted as val}
        <li>{val}</li>
    {/each}
</ul>
