<script lang="ts">
  import Close from "./Icons/Close.svelte";
  import Expanded from "./Icons/Expanded.svelte";
  import TerminalLine from "./TerminalLine.svelte";

  let expanded : boolean = false;
</script>

<div class="bg-black grow flex flex-col w-full">
  <div class="bg-white/10">
    <div class="text-white font-light flex">
      <span class="grow p-2 px-4">History</span>
      <div class="flex flex-col active:bg-orange-500">
        {#if expanded}
        <Close class="p-2 grow place-self-center" on:click={()=>{ expanded = true; }}/>
        {:else}
        <Expanded class="p-2 mx-2 grow place-self-center" on:click={()=>{ expanded = false; }}/>
        {/if}
      </div>
    </div>
  </div>
  <div class="px-2 pb-4 pt-2 touch-auto overflow-scroll scrollbar-hide text-white font-mono text-xs">
    <TerminalLine>Light Engine Auto-calliberation </TerminalLine>
    <TerminalLine isPausable={true}>Exposure initiated for 2m 30s at 321mJ/cm2 (21%)</TerminalLine>
    <TerminalLine isComplete={true}>Exposure complete.</TerminalLine>
    <TerminalLine isPausable={true}>Exposure initiated for 1m 10s at 167mJ/cm2 (12%)</TerminalLine>
    <TerminalLine isComplete={true}>Exposure complete.</TerminalLine>
    <TerminalLine isPausable={true}>Exposure initiated for 1m 10s at 167mJ/cm2 (12%)</TerminalLine>
    <TerminalLine isResumable={true}>Exposure Paused after 32s of exposure. </TerminalLine>
  </div>
</div>
