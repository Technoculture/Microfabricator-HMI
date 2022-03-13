<script lang="ts">
  let count: number = 0;
  const increment = () => {
    count += 1;
  };
</script>

<button
  class="px-4 py-2 w-min-20 bg-amber-200 focus:ring-2 ring-amber-500 active:bg-amber-300"
  on:click={increment}
>
  Clicks: {count}
</button>
