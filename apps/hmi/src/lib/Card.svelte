<script lang="ts">
  let className : string = "row-span-2 flex flex-col";
  export { className as class };
  export let title: string = "";
  export let show: boolean = true;

  export let hasRing : boolean = false;
  export let disabled : boolean = false;

  let show_class = "";
  if(show){
    show_class = "shadow-2xl shadow-neutral-800 rounded-2xl ring-slate-400 ";
    if(disabled){
    } else {
      if(hasRing) {
        show_class = show_class.concat("active:ring-4 active:ring-orange-400");
      }
    }
  } else {
    show_class = "invisible";
  }

  // console.log([hasRing, show_class]);
</script>

{#if show}
<div class={`${className} ${show_class} bg-gradient-to-r from-black/80 via-gray-900/90 to-black/80 relative overflow-hidden`} >
  {#if title !== ""}
    <!-- <div class="relative">
      <span class="absolute right-2 top-2 inline-flex h-1 w-1 rounded-full bg-orange-500 opacity-75" />
    </div> -->
    <span class="p-3 text-white text-sm font-extralight grow">{ title }</span>
  {/if}
  <slot />
  {#if disabled}
  <div class="absolute bg-gray-600/80 z-100 h-full w-full" />
  {/if}
</div>
{/if}
