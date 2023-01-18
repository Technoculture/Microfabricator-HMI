<script lang="ts">
  let className : string = "row-span-2 flex flex-col";
  export { className as class };
  export let title: string = "";
  export let show: boolean = true;

  export let hasRing : boolean = false;
  export let disabled : boolean = false;
  export let cardOn : boolean = false;

  let show_class = "";
  if(show){
    show_class = "shadow-2xl shadow-neutral-800 rounded-2xl ";
    if(!disabled){
      if(hasRing){
        if (cardOn) {
            console.log("cardOn!!!");
            show_class += "ring-4 ring-orange-300 ";
        }
        show_class += "active:ring-4 active:ring-orange-400";
      }
    }
    console.log(show_class);
  } else {
    show_class = "invisible";
  }
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
  <div class="absolute bg-gray-400/50 z-100 h-full w-full" />
  {/if}
</div>
{/if}

