<script lang="ts">
  export let percentage: Number = 0;
</script>

<div>
  {#if percentage > 0}
    <div class="h-full flex">
      <div style={`width:${percentage}%; height:80px`} class="flex flex-col bg-green-400 shadow-inner"></div>
    </div>
    <div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 text-white text-mono text-xl">
      {percentage}%
    </div>
  {/if}
</div>
