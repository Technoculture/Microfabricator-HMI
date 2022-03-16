<script lang="ts">
  import { slide } from 'svelte/transition';

  import Card from "../Card.svelte";
  import LockOpen from "../Icons/LockOpen.svelte";
  import RightArrow from "../Icons/RightArrow.svelte";
  import UpArrow from "../Icons/UpArrow.svelte";

  let stageButtonActive = false;
  let leButtonActive = false;

  function toggleStageButton() {
    if(leButtonActive) {
      leButtonActive = !leButtonActive;
    }
    stageButtonActive = !stageButtonActive;
  }

  function toggleLeButton() {
    if(stageButtonActive) {
      stageButtonActive = !stageButtonActive;
    }
    leButtonActive = !leButtonActive;
  }
</script>

<div class="flex snap-center overflow-x-scroll scrollbar-hide snap-x snap-mandatory h-full">
  <div class="flex flex-col">
    <slot />
    {#if stageButtonActive || leButtonActive}
      <div transition:slide class="absolute bottom-0 mb-14 w-full p-4 bg-black flex flex-col">
        <span class="text-white py-1 text-xs">
          {#if stageButtonActive}
            Are you sure, this action will unlock the stage module 4S and allow you to remove it out
          {:else if leButtonActive}
            Are you sure, this action will unlock the light engine module and allow you to remove it out
          {/if}
        </span>
        <button class="px-6 h-10 bg-red-500 active:bg-red-600 my-1 rounded-lg grow flex place-content-between"
          on:click={toggleStageButton}
        >
          <span class="place-self-center">Eject</span>
          <LockOpen class="place-self-center h-5 w-5" />
        </button>
      </div>
    {/if}
  </div>
  
</div>
<div class="flex h-16">
  <Card class="col-span-2 flex text-white text-center font-extralight text-xl overflow-hidden grow rounded-none" hasRing={true}>
    <div class="flex flex-grow h-full active:bg-black ">
      <span class="grow place-content-center flex" 
        on:click={toggleStageButton}
      >
        <span class="place-self-center pr-4">4S</span>
        {#if stageButtonActive}
          <UpArrow class="h-4 w-4 place-self-center" />
        {:else}
          <RightArrow class="h-4 w-4 place-self-center" />
        {/if}
      </span>
    </div>
    <div class="flex flex-grow h-full active:bg-black" >
      <span class="grow place-content-center flex"
        on:click={toggleLeButton}
      >
        <span class="place-self-center pr-4">365nm</span>
        {#if leButtonActive}
          <UpArrow class="h-4 w-4 place-self-center" />
        {:else}
          <RightArrow class="h-4 w-4 place-self-center" />
        {/if}
      </span>
    </div>
  </Card>
</div>