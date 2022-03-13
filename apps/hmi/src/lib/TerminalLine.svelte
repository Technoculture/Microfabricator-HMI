<script lang="ts">
  const date_time_text : string = "23:56";
</script>

<div class="flex gap-2">
  <span class="text-2xs text-orange-400">
    {date_time_text}> 
  </span>
  <span class="grow text-gray-200">
    <slot />
  </span>
</div>
