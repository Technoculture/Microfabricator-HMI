<script lang="ts">
  let className : string = "row-span-2 flex flex-col";
  export { className as class };
  export let title: string = "";
  export let show: boolean = true;

  let show_class = "";
  if(show){
    show_class = "shadow-2xl shadow-neutral-600 rounded-2xl active:ring-4 ring-slate-400 active:ring-orange-400";
  } else {
    show_class = "invisible";
  }
</script>

{#if show}
<div class={`${className} ${show_class} bg-gradient-to-r from-black/70 via-gray-900/80 to-black/80`} >
  {#if title !== ""}
    <span class="p-3 text-white text-sm font-extralight grow">{ title }</span>
  {/if}
  <slot />
</div>
{/if}
