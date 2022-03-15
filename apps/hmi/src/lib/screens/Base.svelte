<script lang="ts">
// import { writable } from "svelte/store";

  import Card from "../Card.svelte";
import LockOpen from "../Icons/LockOpen.svelte";

  let stageButtonActive = false;
  const toggleStageButton = () => {
    bind:stageButtonActive = !stageButtonActive;
  }
</script>

<div class="flex snap-center overflow-x-scroll scrollbar-hide snap-x snap-mandatory h-full">
  <div class="flex flex-col">
    <slot />
    {#if stageButtonActive}
      <div class="absolute bottom-0 mb-14 w-full p-4 bg-black flex flex-col">
        <span class="text-white py-1 text-xs">
          Are you sure, this action will unlock the stage module 4S and allow you to remove it out
        </span>
        <button class="font-bold px-2 h-12 bg-red-500 my-1 rounded-lg grow flex place-content-between">
          <span class="place-self-center">Eject</span>
          <LockOpen class="place-self-center h-4" />
        </button>
      </div>
    {/if}
  </div>
  
</div>
<div class="flex h-16">
  <Card class="col-span-2 flex text-white text-center font-extralight text-xl overflow-hidden grow rounded-none" hasRing={true}>
    <div class="flex flex-grow h-full active:bg-black ">
      <span class="flex-grow place-self-center" 
        on:click={toggleStageButton}
      >
        4S
      </span>
    </div>
    <div class="flex flex-grow h-full active:bg-black" >
      <span class="flex-grow place-self-center">
        365nm
      </span>
    </div>
  </Card>
</div>